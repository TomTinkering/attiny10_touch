#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#define TRUE (1)
#define FALSE (0)




void init(void);



typedef enum state_t {

    TAKEN_PASSED    = 0,
    LED_EN          = 1,
    SET_LED_DIRECT  = 2,
    TOUCHED         = 3,
    RESERVED        = 4,
    LED0            = 5,
    LED1            = 6,
    LED2            = 7

} state_t;

typedef enum msg_t {

    MSG_SLOT_TAKEN  = 0,
    MSG_LED_EN      = 1,
    MSG_LED_DIRECT  = 2,
    MSG_IS_TOUCHED  = 3,
    MSG_RESERVED    = 4,
    MSG_LED0        = 5,
    MSG_LED1        = 6,
    MSG_LED2        = 7

} msg_t;


#define DEFAULT_CONFIGURATION (0b10101010) //TODO: change to proper setting
#define WRITE_PROTECT_DISABLE_SIG (0xD8)

#define TOUCH_TIMEOUT ((uint16_t)40000) //roughly 4ms @ 8MHz
#define TOUCH_PIN (PIN1) //TODO: set proper pin (change interrupt)
#define LED_PIN   (PIN0)

//the number of instructions before INT0 is executed
#define ISR_OFFSET     (4+10) //4 till call, 10 till instruction

//next sample instant 1/19200 = 52us =~ 417 tim-ticks @ 8MHz
#define UART_BIT_TIME       ((uint16_t)417) //number of clock ticks @8MHz per bit

#define UART_OCR_OFFSET     (4+10) //4 till call, 10 till instruction
#define UART_OCR_INC        ((UART_BIT_TIME / 2)-UART_OCR_OFFSET)
#define UART_HALF_OCR_INC   (UART_BIT_TIME-UART_OCR_OFFSET)

#define UART_RX_PIN    (PB2)
#define UART_TX_PIN    (PB3)
#define UART_START     (0)
#define UART_STOP      (9)

//protocol definitions
#define SLOT_TAKEN_BIT (7)


//some macro's to avoid stupid mistakes...
#define IS_SET(var,b)   (var & (1 << b))
#define IS_NSET(var,b)   !(var & (1 << b))
#define SET(var,b)      (var |= (1 << b))
#define CLR(var,b)      (var &= ~(1 << b))
#define B(b)            (1 << b)


//mask that determina what bits not to cpoy from rx msg
#define CONF_BIT_MASK (B(MSG_SLOT_TAKEN) | B(MSG_RESERVED) | B(MSG_IS_TOUCHED))
#define CONF_LED_MASK (B(LED0) | B(LED1) | B(LED2))


//multiplier to avoid floating point...
#define FILTER_MAX (1024)
//portion of multiplier that is given to new value (USE POWER OF 2!!)
#define FILTER_NEW (32)
//portion of multiplier that is given to running average
#define FILTER_AVG (FILTER_MAX-FILTER_NEW)
//low pass filter, use sparingly, costly instruction wise
#define TOUCH_FILTER_LP(avg,new) ((uint16_t)(( (((uint32_t)avg)*FILTER_AVG) + (((uint32_t)new)*FILTER_NEW) ) / FILTER_MAX))


//level above measurement noise level to detect touch
#define TOUCH_THRESHOLD (512)
//number of measurements in a row, that are above threshold needed to trigger touch
#define TOUCH_VALID_CNT (2)


uint16_t    cur_meas;
uint8_t     cur_conf,cur_touch;
uint8_t     cur_rx,cur_tx,tx_cnt;
uint8_t     state;
uint8_t     led_val;

uint8_t     touch_cnt;
uint16_t    touch_new;
uint16_t    touch_avg; //use sparsely on 8-bit machine...



int main(void) {

  init();

  //uart is only processed at end of each byte,in the interrupt handler
  //this leaves all the other time for processing measurements
  //this allows higher UART speeds

  while(TRUE){

      //check for touch timeout / process measurement
      if( (TCNT0 >= TOUCH_TIMEOUT)  ) {

          //get input capture time, or limit if no capture occured
          touch_new=(IS_SET(TIFR0,ICF0)) ? ICR0 : TOUCH_TIMEOUT;
          //determine new running average
          touch_avg = TOUCH_FILTER_LP(touch_avg,touch_new);
          //compare new measurement to running average
          if(touch_new > (touch_avg + TOUCH_THRESHOLD)){
              touch_cnt++;
              if(touch_cnt >= TOUCH_VALID_CNT){
                  touch_cnt = TOUCH_VALID_CNT; //need for prolonged touch > 1s (avoid overflow)
                  SET(state,TOUCHED);
              }
          } else {
              touch_cnt = 0;
          }

          //start new measurement (clear ICF0, set pin to LOW)
          SET(TIFR0,ICF0);
          CLR(PORTB,TOUCH_PIN);
          SET(DDRB,TOUCH_PIN);
      }

      //enable or disable led based on system state
      if( IS_SET(state,LED_EN) || (IS_SET(state,SET_LED_DIRECT) && IS_SET(state,TOUCHED)) ){
          //set led pin to output
          SET(DDRB,LED_PIN);
          CLR(PUEB,LED_PIN);
      } else { //turn off led
          //just setting pin to input is enough
          CLR(DDRB,LED_PIN);
          SET(PUEB,LED_PIN);
      }


  }

  //should not reach
  return 0;
}


void init(void){

    cli(); //disable interrupts for the time being

    //set clock to 8Mhz, no prescaler, factory calibration
    CCP = WRITE_PROTECT_DISABLE_SIG;
    CLKPSR = 0x00;
    CLKMSR = 0x00;

    //GPIO init
    PORTB = B(LED_PIN) | B(UART_TX_PIN);
    DDRB  = B(LED_PIN) | B(TOUCH_PIN) | B(UART_TX_PIN);
    PUEB  = B(UART_RX_PIN);

    //set timer normal mode (0xFFFF top is convenient for UART)
    //disconnect output compare functionality
    //enable input capture noise filter, trigger on rising edge ( 0->1)
    //leave timer disabled for now (no clock source)
    TCCR0A = 0x00;
    TCCR0B = B(ICNC0) | B(ICES0);
    //disable interrupts and clear timer for now
    TIMSK0 = 0x00;
    TCNT0  = 0x0000;

    //TODO: RSTDISBL bit ...fuse

    //since all interrupts are disabled, cur_rx will be read as first config
    cur_rx = DEFAULT_CONFIGURATION;
    //enable ovf interrupt, start the timer and let the magic begin
    SET(TIMSK0,TOIE0);
    SET(TCCR0B,CS00);
    sei();

}






//=====================================
//INTERRUPT HANDLERS
//=====================================

//external interrupt (start of UART RX)
ISR(INT0_vect){

    //allow touch to interrupt
    sei();

    //set first sample time
    OCR0A = TCNT0+UART_HALF_OCR_INC;
    //disable external interrupt, enable COMPA interrupt
    EIMSK = 0x00;
    SET(TIMSK0,OCIE0B);

}

//OCR0A interrupt handler
ISR(TIM0_COMPB_vect){

    //allow touch to interrupt
    sei();

    //update OCR0A (always to reduce jitter)
    OCR0A += UART_OCR_INC;

    //update RX and TX
    if(tx_cnt == UART_START){
        //don't store sample, set TX low
        CLR(PORTB,UART_TX_PIN);
        //icrement tx counter
        tx_cnt++;
    } else if (tx_cnt < UART_STOP) {
        //store RX samle
        cur_rx |= ((PINB >> 2) & 0x01);
        cur_rx = (cur_rx << 1);
        //set TX output
        PORTB  = (PORTB & ~(1 << UART_TX_PIN)) | ((cur_tx & 0x01) << UART_TX_PIN);
        cur_tx = (cur_tx >> 1);
        //increment tx counter
    } else {
        //don't sample, set TX high
        SET(PORTB,UART_TX_PIN);
        //disable this interrupt until next RX byte
        CLR(TIMSK0,OCIE0B);
        //we are done, set tx_counter to 0
        tx_cnt = 0x00;

        //cur_rx done, check if message is for us
        if( IS_SET(cur_rx,MSG_SLOT_TAKEN) && IS_SET(state,TAKEN_PASSED) ){

            //if for us, store settings, refresh button state
            state = (cur_rx & ~CONF_BIT_MASK) | (state & CONF_BIT_MASK);
            cur_tx = cur_rx | B(MSG_SLOT_TAKEN) | IS_SET(state,TOUCHED);
            //update state flags
            state &= ~B(TAKEN_PASSED) & ~B(TOUCHED);
            //set led PWM output based on new config (only control upper bits, rest 1)
            OCR0AH = ~CONF_LED_MASK | state;
            OCR0AL = 0xFF;

        } else {
            //if not for us pass on untouched
            cur_tx = cur_rx;
        }

        //go to uart idle state (enable EXTI)
        EIFR  = (1<<INTF0); //clear external interrupt state
        EIMSK = (1 << INT0);
    }

}



#if LED_PIN != PIN0
#  error "change interrupt routines when changing LED_PIN definition"
#endif
#if TOUCH_PIN != PIN1
#  error "change interrupt routines when changing TOUCH_PIN definition"
#endif

//TIM0 overflow handler,
//Start touch measurement by setting pin to input
//also clear led pin, for PWM (pwm mode does not allow 0xFFFF as top....)
ISR(TIM0_OVF_vect, ISR_NAKED){
    //set cap_touch pin to input pin to input
    //PORTB &= ~(1 << LED_PIN);
    //DDRB &= ~(1 << TOUCH_PIN);
    asm("cbi 2,0");
    asm("cbi 1,1");
    asm("reti");
}


//kind of stupid, but needed since non-pwm mode makes PWM generation hard
//cannot set to PWM mode because the TOP values are either changing
//OC0A, OC0B and ICR, or TOP value is too low (0x03FF max).
ISR(TIM0_COMPA_vect, ISR_NAKED){
    //set cap_touch pin to input pin to input
    //PORTB &= ~(1 << LED_PIN);
    //DDRB &= ~(1 << TOUCH_PIN);
    asm("sbi 2,0");
    asm("reti");
}

