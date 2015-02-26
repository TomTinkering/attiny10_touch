#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#define TRUE (1)
#define FALSE (0)
#define TIM_OCR_START ((uint16_t)208)
#define NEW_SAMPLE (0xFF)
#define OLD_SAMPLE (0x00)
#define CAP_TOUCH_PIN (PIN1) //TODO: set proper pin
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

//the number of instructions before INT0 is executed
#define ISR_OFFSET     (4+10) //4 till call, 10 till instruction
#define UART_BIT_TIME  ((uint16_t)417) //number of clock ticks @8MHz per bit
#define UART_HALF_BIT_TIME  ((UART_BIT_TIME / 2)-ISR_OFFSET) //number of clock ticks @8MHz per bit
#define UART_BUFF_SIZE (4)
#define UART_RX_BIT    (PB0)
#define UART_TX_BIT    (PB1)
#define UART_RX_PORTx  (PORTB)
#define UART_TX_PORTx  (PORTB)
#define UART_RX_PINx   (PINB)
#define UART_TX_PINx   (PINB)

#define HIGH (0xFF)
#define LOW  (0x00)

#define UART_SET_START(port,pin) (port &= ~(1<<pin))
#define UART_SET_STOP(port,pin)  (port |= (1<<pin))
#define UART_GET_START(port,pin) (~port & (1<<pin))

//uart buffers
//TODO: probably not needed
uint8_t tx[UART_BUFF_SIZE];
uint8_t rx[UART_BUFF_SIZE];

uart_state_t rx_state;
uart_state_t tx_state;

uint8_t ocr_state;
uint8_t bit_nr;
uint8_t rx_in;
uint8_t cur_rx;
uint8_t cur_tx;
uint8_t tx_out;
uint8_t rx_nr_recv;
uint8_t tx_nr_sent;
uint8_t cur_rx_pos;
uint8_t cur_tx_pos;
uint8_t uart_cnt;




static inline void handle_uart_io(void);

int main(void) {

  init();

  while(TRUE){

      handle_uart_io();




  }

  return 0;
}


static inline void handle_uart_io(void){

    //TODO: error checking here (has the sampling interrupt occured?)

    //add sample to state, if byte is complete, store in buffer

    switch (rx_state){

    case IDLE:
        if(rx_in == 0) { //if 0 was received
            rx_state = RECEIVING;
            rx_nr_recv=0;
            cur_rx = 0;
        }
        break;

    case RECEIVING :
        //increment number received bits
        rx_nr_recv++;
        //store received bit
        cur_rx |= (rx_in << rx_nr_recv);
        //check if full byte is received
        if(rx_nr_recv == 8){
            rx_state = STOP;
        }
        break;

    case STOP :
        if(rx_in){
            rx[cur_rx_pos] = cur_rx;
            rx_state = IDLE;
        }
        break;
    }


    //handle TX
    switch (tx_state){

    case IDLE:
        if(cur_tx_pos != 0) { //if data is waiting
            tx_out = LOW;
            tx_state = SENDING;
            tx_nr_sent=0;
        } else {
            tx_out = HIGH;
        }
        break;

    case SENDING :
        //increment number received bits
        tx_nr_sent++;
        //store received bit
        tx_out |= (cur_tx >> tx_nr_sent) & (0x01);
        //check if full byte is received
        if(tx_nr_sent == 8){
            tx_state = STOP;
        }
        break;

    case STOP :
        tx_out = HIGH;
        tx_state = IDLE;
        break;
    }

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
    TIMSK0 = (1<<TOIE0) | (1<<OCIE0A) | (1<<OCIE0B);
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






//=====================================
//INTERRUPT HANDLERS
//=====================================

//Warning, interrupts are ISR_NAKED to reduce jitter in the start
//of the cap measurement and UART sample times. Be careful when
//changing

//external interrupt
ISR(INT0_vect,ISR_NAKED){
    //enter interrupt
    asm("push r16");
    asm("in r16,__SREG__");
    asm("push r24");
    asm("push r25");
    //OCR0A = TCNT0+UART_HALF_BIT_TIME;
    asm("in r24,40");
    asm("in r25,41");
    asm("subi r24,lo8(-(194))");
    asm("sbci r25,hi8(-(194))");
    asm("out 39,r25");
    asm("out 38,r24");
    //EIMSK = 0x00;
    asm("ldi r24,lo8(0)");
    asm("out 19,r24");
    //exit interrupt
    asm("pop r25");
    asm("pop r24");
    asm("out __SREG__,r16");
    asm("pop r16");
    asm("reti");
}


//TIM0 overflow handler, measurement start
ISR(TIM0_OVF_vect, ISR_NAKED){
    //set cap_touch pin to input pin to input
    //DDRB = (1 << CAP_TOUCH_PIN);
    asm("push r24");
    asm("ldi r24,lo8(2)");
    asm("out 1,r24");
    asm("pop r24");
    asm("reti");
}


//TIM0 overflow handler
ISR(TIM0_COMPB_vect,ISR_NAKED){
    //only enable OCR0A interrupt
    //TIMSK0 = oc_state;
    asm("push r24");
    asm("lds r24,ocr_state");
    asm("out 43,r24");
    asm("pop r24");
    asm("reti");
}


//OCR0A interrupt handler
ISR(TIM0_COMPA_vect){

    //update OCR0A
    OCR0A += UART_BIT_TIME - ISR_OFFSET;
    //sample input
    cur_rx |= ((PINB >> 2) & 0x01) << 1;
    //set output
    PINB |= cur_tx;
    //increment count
    uart_cnt++;
    if(uart_cnt > 9){
        //disable OCR0A interrupt until processed
        TIMSK0 &= ~(1 << OCIE0A);
        ocr_state = 0x00;
    }

}
