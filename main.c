#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#define TRUE (1)
#define FALSE (0)
#define TIM_OCR_START ((uint16_t)208)
#define NEW_SAMPLE (0xFF)
#define OLD_SAMPLE (0x00)
#define CAP_TOUCH_PIN (PB2) //TODO: set proper pin
//next sample instant 1/19200 = 52us =~ 417 tim-ticks @ 8MHz
#define OCR_INCREMENT ((uint16_t)417)


void init(void);


uint16_t cur_meas;
uint8_t sample_state;

typedef enum uart_state_t {
    IDLE,
    RECEIVING,
    SENDING,
    START,
    STOP
} uart_state_t;

#define UART_BUFF_SIZE (4)
#define UART_RX_BIT    (PB0)
#define UART_TX_BIT    (PB1)
#define UART_RX_PORTx  (PORTB)
#define UART_TX_PORTx  (PORTB)
#define UART_RX_PINx   (PINB)
#define UART_TX_PINx   (PINB)

#define UART_SET_START(port,pin) (port &= ~(1<<pin))
#define UART_SET_STOP(port,pin)  (port |= (1<<pin))
#define UART_GET_START(port,pin) (~port & (1<<pin))

//uart buffers
//TODO: probably not needed
uint8_t tx[UART_BUFF_SIZE];
uint8_t rx[UART_BUFF_SIZE];

uart_state_t rx_state;
uart_state_t tx_state;

uint8_t bit_nr;
uint8_t rx_in;
uint8_t tx_out;

static inline void handle_uart(void);

int main(void) {

  init();

  while(TRUE){

      handle_uart();




  }

  return 0;
}


static inline void handle_uart(void){

    //TODO: error checking here (has the sampling interrupt occured?)

    //add sample to state, if byte is complete, store in buffer

    //determine new output bit
        //if in progress, continue
        //if not in progress, but byte in buffer, start
        //if neither, send 1;


}


void init(void){

    //set clock to 8Mhz, no prescaler, factory calibration
    CLKMSR = 0x00;
    OSCCAL = 0x00;
    CLKPSR = 0x00;

    //set timer to CTC mode, no output compare, no prescaler
    //reset on OCROB = floor(65536 / OCR_INCREMENT) * OCR_INCREMEN
    //interrupt on OVF and OCIE0A
    TCCR0A = 0x00;
    TCCR0B = 0x00; //leave timer disabled for now (1<<CS00);
    TIMSK0 = (1<<TOIE0) | (1<<OCIE0A);
    //set first compare value to 1/19200/2 = 26us = 208 tim-ticks @ 8MHz
    //TODO: verify 16 bit access
    OCR0A = TIM_OCR_START;


    //GPIO init
    //set led and touch to output
    //set one pin to output for uart
    //the other to input with pullup for uart

    //set sample state to old
    sample_state = OLD_SAMPLE;

}

////external interrupt -> store timer value
//ISR(PCINT0_vect,ISR_NAKED)
//{
//   //cur_meas = TCNT0; TCNT0 = 0x28 = 40
//   asm("push r24");
//   asm("push r25");
//   asm("in r24,40");
//   asm("in r25,41");
//   asm("sts cur_meas+1,r25");
//   asm("sts cur_meas,r24");
//   asm("pop r25");
//   asm("pop r24");
//   asm("reti");
//}


ISR(INT0_vect)
{
   cur_meas = TCNT0;
}




//TIM0 overflow handler
//start new measurement, quit.
ISR(TIM0_COMPB_vect){
    //enable eternal interrupt
    PCICR |= (1 << PCIE0);
    //set pin to input
    DDRB &= ~(1 << CAP_TOUCH_PIN);
    //disable

}


//OCR0A interrupt handler
ISR(TIM0_COMPA_vect){

    //store new rx_in value;
    rx_in = UART_RX_PINx & (1 << UART_RX_BIT);
    //write next output bit
    UART_TX_PORTx = ()
    //update interrupt compare value
    OCR0A += OCR_INCREMENT;

}
