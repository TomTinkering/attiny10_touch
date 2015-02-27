#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#define TRUE (1)
#define FALSE (0)

#define CAP_TOUCH_PIN (PIN1) //TODO: set proper pin

#define OCR_INCREMENT ((uint16_t)417)


void init(void);


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

uint16_t       cur_meas;
uint8_t cur_conf,cur_touch;
uint8_t cur_rx,cur_tx,tx_cnt;

int main(void) {

  init();

  while(TRUE){

      //if uart cycle has completed (both interrupts disabled) prepare next
      if( ( EIMSK & (1 << INT0) ) && ( TIMSK0 & (1 << OCIE0B) ) )
      {

          //check if  is for us
          if(cur_rx & (1 << SLOT_TAKEN_BIT)){
              //if for us, store settings, refresh button state
              cur_conf = cur_rx;
              cur_tx = cur_rx | (1<<SLOT_TAKEN_BIT) | cur_touch;
          } else {
              //if not for us pass on untouched
              cur_tx = cur_rx;
          }

          //go to uart idle state (enable EXTI)
          EIFR  = (1<<INTF0); //clear external interrupt state
          EIMSK = (1 << INT0);

      }



//      //is measurement is done, store and start next
//      if(TIFR0 & (1<<ICF0)){
//
//          //calculate duration
//          cur_meas = ((uint16_t)ICR0) - cur_meas;
//
//          //----------------------------
//          //critical section (keep short)
//          cli(); //disable interrupts
//          //store timer value
//          cur_meas = TCNT0;
//          //set output pin
//
//          sei(); //enable interrupts
//          //----------------------------
//
//      }




  }

  return 0;
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


    //GPIO init
    //set led and touch to output
    //set one pin to output for uart
    //the other to input with pullup for uart


}






//=====================================
//INTERRUPT HANDLERS
//=====================================

//Warning, interrupts are ISR_NAKED to reduce jitter in the start
//of the cap measurement and UART sample times. Be careful when
//changing

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


//TIM0 overflow handler,
//Start touch measurement by setting pin to input
ISR(TIM0_OVF_vect, ISR_NAKED){
    //set cap_touch pin to input pin to input
    //DDRB ^= (1 << CAP_TOUCH_PIN);
    asm("push r24");
    asm("in r24,1-0");
    asm("ldi r25,lo8(2)");
    asm("eor r24,r25");
    asm("out 1-0,r24");
    asm("reti");
}


////TIM0 OCR0B match handler
////Disable timer interrupts for touch, until main has processed
////measurement
//ISR(TIM0_CAPT_vect,ISR_NAKED){
//    //TIMSK0 &= (1<<OCIE0B);
//    asm("push r24");
//    asm("in r24,43");
//    asm("andi r24,lo8(4)");
//    asm("out 43,r24");
//    asm("pop r24");
//    asm("reti");
//}
