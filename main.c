#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#define TRUE (1)
#define FALSE (0)




void init(void);


typedef enum state_t {

    LED_EN          = 0,
    SET_LED_DIRECT  = 1,
    TOUCHED         = 2,
    RESERVED0       = 3,
    RESERVED1       = 4,
    RESERVED2       = 5,
    RESERVED3       = 6,
    TAKEN_PASSED    = 7,

} state_t;

typedef enum msg_t {

    MSG_LED_EN      = 0,
    MSG_LED_DIRECT  = 1,
    MSG_IS_TOUCHED  = 2,
    MSG_RESERVED0   = 3,
    MSG_RESERVED1   = 4,
    MSG_RESERVED2   = 5,
    MSG_RESERVED3   = 6,
    MSG_SLOT_TAKEN  = 7,

} msg_t;


#define DEFAULT_CONFIGURATION (0b10101010) //TODO: change to proper setting

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

#define IS_SET(var,b)  (var & (1 << b))

uint16_t    cur_meas;
uint8_t     cur_conf,cur_touch;
uint8_t     cur_rx,cur_tx,tx_cnt;
uint8_t     state;
uint8_t     led_val;


int main(void) {

  init();

  while(TRUE){

      //if uart cycle has completed (both interrupts disabled) prepare next
      if( ( EIMSK & (1 << INT0) ) && ( TIMSK0 & (1 << OCIE0B) ) )
      {

          //check if message is for us
          if( IS_SET(cur_rx,MSG_SLOT_TAKEN) && IS_SET(state,TAKEN_PASSED) ){
              //if for us, store settings, refresh button state
              cur_conf = cur_rx;
              cur_tx = cur_rx | (1<<MSG_SLOT_TAKEN) | (state & (1 << TOUCHED));
              //update state flags
              state &= ~(1 << TAKEN_PASSED) & ~(1 << TOUCHED);

          } else {
              //if not for us pass on untouched
              cur_tx = cur_rx;
          }

          //go to uart idle state (enable EXTI)
          EIFR  = (1<<INTF0); //clear external interrupt state
          EIMSK = (1 << INT0);

      }

      //check for touch timeout / process measurement
      if( (TCNT0 >= TOUCH_TIMEOUT)  ) {
          //disable touch interrupt
          TIMSK0 &= (1 << TOIE0);
          //set touch pin to output
          DDRB |= (1 << TOUCH_PIN);
          //process measurement
                  //....
          //start new measurement
          TIMSK0 |= (1 << TOIE0);
      }


      //set led brightness based on state
      if( IS_SET(state,LED_EN) || (IS_SET(state,SET_LED_DIRECT) && IS_SET(state,TOUCHED)) ){
          OCR0AH = led_val;
          OCR0AL = 0x00;
      } else {
          OCR0AH = 0x00;
          OCR0AL = 0x00;
      }



  }

  return 0;
}


void init(void){

    cli(); //disable interrupts for the time being

    //set clock to 8Mhz, no prescaler, factory calibration
    //TODO: magic value for this to work, see datasheet
    CLKMSR = 0x00;
    OSCCAL = 0x00;
    CLKPSR = 0x00;

    //set timer normal mode (0xFFFF top is convenient for UART)
    //disconnect output compare functionality
    //enable input capture noise filter, trigger on rising edge ( 0->1)
    //leave timer disabled for now (no clock source)
    TCCR0A = 0x00;
    TCCR0B = (1 << ICNC0) | (1 << ICES0);
    //disable interrupts for now
    TIMSK0 = 0x00;

    //GPIO init
    //set led and touch to output
    //set one pin to output for uart
    //the other to input with pullup for uart

    //since all interrupts are disabled, cur_rx will be read as first config
    cur_rx = DEFAULT_CONFIGURATION;
    //enable ovf interrupt, start the timer and let the magic begin
    TIMSK0 |= (1 << TOIE0);
    TCCR0B |= (1 << CS00);
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
    TIMSK0 |= (1<<OCIE0B);

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
        PORTB &= ~(1 << UART_TX_PIN);
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
        PORTB |= (1<<UART_TX_PIN);
        //enable external interrupt, enable COMPA interrupt
        //EIMSK = 0x01; TODO:think about sync with main
        TIMSK0 &= ~(1<<OCIE0B);
        //we are done, set tx_counter to 0
        tx_cnt = 0x00;
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

