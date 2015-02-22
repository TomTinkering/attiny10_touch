	.file	"main.c"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__ = 0x3c
__tmp_reg__ = 16
__zero_reg__ = 17
	.global __do_copy_data
	.global __do_clear_bss
	.text
.Ltext0:
	.cfi_sections	.debug_frame
.global	init
	.type	init, @function
init:
.LFB8:
	.file 1 "main.c"
	.loc 1 87 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 90 0
	out 55-0,__zero_reg__
	.loc 1 91 0
	out 57-0,__zero_reg__
	.loc 1 92 0
	out 54-0,__zero_reg__
	.loc 1 97 0
	out 46-0,__zero_reg__
	.loc 1 98 0
	out 45-0,__zero_reg__
	.loc 1 99 0
	ldi r24,lo8(3)
	out 43-0,r24
	.loc 1 102 0
	ldi r24,lo8(208)
	ldi r25,hi8(208)
	out 38+1-0,r25
	out 38-0,r24
	.loc 1 111 0
	sts sample_state,__zero_reg__
/* epilogue start */
	.loc 1 113 0
	ret
	.cfi_endproc
.LFE8:
	.size	init, .-init
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB6:
	.loc 1 55 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 57 0
	rcall init
.L3:
	rjmp .L3
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.text
.global	__vector_6
	.type	__vector_6, @function
__vector_6:
.LFB9:
	.loc 1 142 0
	.cfi_startproc
	push r17
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 17, -2
	push r16
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 16, -3
	in r16,__SREG__
	push r16
	ldi __zero_reg__,lo8(0)
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	.loc 1 144 0
	sbi 18-0,0
	.loc 1 146 0
	cbi 1-0,2
/* epilogue start */
	.loc 1 149 0
	pop r16
	out __SREG__,r16
	pop r16
	pop r17
	reti
	.cfi_endproc
.LFE9:
	.size	__vector_6, .-__vector_6
.global	__vector_5
	.type	__vector_5, @function
__vector_5:
.LFB10:
	.loc 1 153 0
	.cfi_startproc
	push r17
.LCFI2:
	.cfi_def_cfa_offset 3
	.cfi_offset 17, -2
	push r16
.LCFI3:
	.cfi_def_cfa_offset 4
	.cfi_offset 16, -3
	in r16,__SREG__
	push r16
	ldi __zero_reg__,lo8(0)
	push r24
.LCFI4:
	.cfi_def_cfa_offset 5
	.cfi_offset 24, -4
	push r25
.LCFI5:
	.cfi_def_cfa_offset 6
	.cfi_offset 25, -5
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	.loc 1 156 0
	in r24,0-0
	andi r24,lo8(1)
	sts rx_in,r24
	.loc 1 160 0
	in r24,38-0
	in r25,38+1-0
	subi r24,lo8(-(417))
	sbci r25,hi8(-(417))
	out 38+1-0,r25
	out 38-0,r24
/* epilogue start */
	.loc 1 162 0
	pop r25
	pop r24
	pop r16
	out __SREG__,r16
	pop r16
	pop r17
	reti
	.cfi_endproc
.LFE10:
	.size	__vector_5, .-__vector_5
	.comm tx_out,1,1
	.comm rx_in,1,1
	.comm bit_nr,1,1
	.comm tx_state,1,1
	.comm rx_state,1,1
	.comm rx,4,1
	.comm tx,4,1
	.comm sample_state,1,1
	.comm cur_meas,2,1
.Letext0:
	.file 2 "/opt/cross/avr/bin/../lib/gcc/avr/4.6.2/../../../../avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1d5
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF25
	.byte	0x1
	.long	.LASF26
	.long	.LASF27
	.long	0
	.long	0
	.long	.Ldebug_ranges0+0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
	.byte	0x7a
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x7c
	.long	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.long	.LASF14
	.byte	0x1
	.byte	0x1
	.byte	0x15
	.long	0xa2
	.uleb128 0x6
	.long	.LASF9
	.sleb128 0
	.uleb128 0x6
	.long	.LASF10
	.sleb128 1
	.uleb128 0x6
	.long	.LASF11
	.sleb128 2
	.uleb128 0x6
	.long	.LASF12
	.sleb128 3
	.uleb128 0x6
	.long	.LASF13
	.sleb128 4
	.byte	0
	.uleb128 0x3
	.long	.LASF14
	.byte	0x1
	.byte	0x1b
	.long	0x77
	.uleb128 0x7
	.long	.LASF28
	.byte	0x1
	.byte	0x48
	.byte	0x1
	.byte	0x3
	.uleb128 0x8
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0x57
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x9
	.byte	0x1
	.long	.LASF29
	.byte	0x1
	.byte	0x37
	.byte	0x1
	.long	0x42
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0xa
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0x8e
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0x99
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.long	.LLST1
	.uleb128 0xb
	.long	.LASF18
	.byte	0x1
	.byte	0x13
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF19
	.byte	0x1
	.byte	0x32
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF20
	.byte	0x1
	.byte	0x12
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_meas
	.uleb128 0xc
	.long	.LASF18
	.byte	0x1
	.byte	0x13
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	sample_state
	.uleb128 0xd
	.long	0x30
	.long	0x15c
	.uleb128 0xe
	.long	0x54
	.byte	0x3
	.byte	0
	.uleb128 0xf
	.string	"tx"
	.byte	0x1
	.byte	0x2b
	.long	0x14c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx
	.uleb128 0xf
	.string	"rx"
	.byte	0x1
	.byte	0x2c
	.long	0x14c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	rx
	.uleb128 0xc
	.long	.LASF21
	.byte	0x1
	.byte	0x2e
	.long	0xa2
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	rx_state
	.uleb128 0xc
	.long	.LASF22
	.byte	0x1
	.byte	0x2f
	.long	0xa2
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx_state
	.uleb128 0xc
	.long	.LASF23
	.byte	0x1
	.byte	0x31
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	bit_nr
	.uleb128 0xc
	.long	.LASF19
	.byte	0x1
	.byte	0x32
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	rx_in
	.uleb128 0xc
	.long	.LASF24
	.byte	0x1
	.byte	0x33
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx_out
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB9
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LFE9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB10
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI3
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI5
	.long	.LFE10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB6
	.long	.LFE6-.LFB6
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB6
	.long	.LFE6
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF9:
	.string	"IDLE"
.LASF15:
	.string	"init"
.LASF11:
	.string	"SENDING"
.LASF19:
	.string	"rx_in"
.LASF27:
	.string	"/home/tomv/workspace/attiny10_touch/"
.LASF1:
	.string	"unsigned char"
.LASF6:
	.string	"long unsigned int"
.LASF24:
	.string	"tx_out"
.LASF18:
	.string	"sample_state"
.LASF25:
	.string	"GNU C 4.6.2"
.LASF12:
	.string	"START"
.LASF22:
	.string	"tx_state"
.LASF14:
	.string	"uart_state_t"
.LASF10:
	.string	"RECEIVING"
.LASF29:
	.string	"main"
.LASF13:
	.string	"STOP"
.LASF4:
	.string	"unsigned int"
.LASF20:
	.string	"cur_meas"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF28:
	.string	"handle_uart"
.LASF7:
	.string	"long long int"
.LASF26:
	.string	"main.c"
.LASF23:
	.string	"bit_nr"
.LASF3:
	.string	"uint16_t"
.LASF17:
	.string	"__vector_5"
.LASF16:
	.string	"__vector_6"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF21:
	.string	"rx_state"
