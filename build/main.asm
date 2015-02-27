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
.LFB7:
	.file 1 "main.c"
	.loc 1 93 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 96 0
	out 55-0,__zero_reg__
	.loc 1 97 0
	out 57-0,__zero_reg__
	.loc 1 98 0
	out 54-0,__zero_reg__
	.loc 1 103 0
	out 46-0,__zero_reg__
	.loc 1 104 0
	out 45-0,__zero_reg__
	.loc 1 105 0
	ldi r24,lo8(7)
	out 43-0,r24
/* epilogue start */
	.loc 1 116 0
	ret
	.cfi_endproc
.LFE7:
	.size	init, .-init
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB6:
	.loc 1 38 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 40 0
	rcall init
	.loc 1 59 0
	ldi r22,lo8(1)
.L9:
	.loc 1 45 0
	sbis 19-0,0
	rjmp .L9
	.loc 1 45 0 is_stmt 0 discriminator 1
	in __tmp_reg__,43-0
	sbrs __tmp_reg__,2
	rjmp .L9
	.loc 1 49 0 is_stmt 1
	lds r25,cur_rx
	sbrs r25,7
	rjmp .L4
	.loc 1 51 0
	sts cur_conf,r25
	.loc 1 52 0
	lds r24,cur_touch
	or r24,r25
	ori r24,lo8(-128)
	sts cur_tx,r24
	rjmp .L5
.L4:
	.loc 1 55 0
	sts cur_tx,r25
.L5:
	.loc 1 59 0
	out 20-0,r22
	.loc 1 60 0
	out 19-0,r22
	rjmp .L9
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.text
.global	__vector_1
	.type	__vector_1, @function
__vector_1:
.LFB8:
	.loc 1 132 0
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
	push r24
.LCFI2:
	.cfi_def_cfa_offset 5
	.cfi_offset 24, -4
	push r25
.LCFI3:
	.cfi_def_cfa_offset 6
	.cfi_offset 25, -5
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	.loc 1 135 0
/* #APP */
 ;  135 "main.c" 1
	sei
 ;  0 "" 2
	.loc 1 137 0
/* #NOAPP */
	in r24,40-0
	in r25,40+1-0
	subi r24,lo8(-(403))
	sbci r25,hi8(-(403))
	out 38+1-0,r25
	out 38-0,r24
	.loc 1 139 0
	out 19-0,__zero_reg__
	.loc 1 140 0
	in r24,43-0
	ori r24,lo8(4)
	out 43-0,r24
/* epilogue start */
	.loc 1 142 0
	pop r25
	pop r24
	pop r16
	out __SREG__,r16
	pop r16
	pop r17
	reti
	.cfi_endproc
.LFE8:
	.size	__vector_1, .-__vector_1
.global	__vector_6
	.type	__vector_6, @function
__vector_6:
.LFB9:
	.loc 1 145 0
	.cfi_startproc
	push r17
.LCFI4:
	.cfi_def_cfa_offset 3
	.cfi_offset 17, -2
	push r16
.LCFI5:
	.cfi_def_cfa_offset 4
	.cfi_offset 16, -3
	in r16,__SREG__
	push r16
	ldi __zero_reg__,lo8(0)
	push r22
.LCFI6:
	.cfi_def_cfa_offset 5
	.cfi_offset 22, -4
	push r23
.LCFI7:
	.cfi_def_cfa_offset 6
	.cfi_offset 23, -5
	push r24
.LCFI8:
	.cfi_def_cfa_offset 7
	.cfi_offset 24, -6
	push r25
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 25, -7
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	.loc 1 148 0
/* #APP */
 ;  148 "main.c" 1
	sei
 ;  0 "" 2
	.loc 1 150 0
/* #NOAPP */
	in r24,38-0
	in r25,38+1-0
	subi r24,lo8(-(194))
	sbci r25,hi8(-(194))
	out 38+1-0,r25
	out 38-0,r24
	.loc 1 153 0
	lds r24,tx_cnt
	tst r24
	brne .L12
	.loc 1 155 0
	cbi 2-0,3
	.loc 1 157 0
	ldi r24,lo8(1)
	sts tx_cnt,r24
	rjmp .L11
.L12:
	.loc 1 158 0
	cpi r24,lo8(9)
	brsh .L14
	.loc 1 160 0
	in r24,0-0
	lsr r24
	lsr r24
	andi r24,lo8(1)
	lds r25,cur_rx
	or r24,r25
	.loc 1 161 0
	lsl r24
	sts cur_rx,r24
	.loc 1 163 0
	in r22,2-0
	lds r23,cur_tx
	mov r24,r23
	ldi r25,lo8(0)
	andi r24,lo8(1)
	andi r25,hi8(1)
	lsl r24
	rol r25
	lsl r24
	rol r25
	lsl r24
	rol r25
	andi r22,lo8(-9)
	or r22,r24
	out 2-0,r22
	.loc 1 164 0
	lsr r23
	sts cur_tx,r23
	rjmp .L11
.L14:
	.loc 1 168 0
	sbi 2-0,3
	.loc 1 171 0
	in r24,43-0
	andi r24,lo8(-5)
	out 43-0,r24
	.loc 1 173 0
	sts tx_cnt,__zero_reg__
.L11:
/* epilogue start */
	.loc 1 176 0
	pop r25
	pop r24
	pop r23
	pop r22
	pop r16
	out __SREG__,r16
	pop r16
	pop r17
	reti
	.cfi_endproc
.LFE9:
	.size	__vector_6, .-__vector_6
.global	__vector_4
	.type	__vector_4, @function
__vector_4:
.LFB10:
	.loc 1 183 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 185 0
	cbi 1-0,1
/* epilogue start */
	.loc 1 190 0
	.cfi_endproc
.LFE10:
	.size	__vector_4, .-__vector_4
	.comm meas_flag,1,1
	.comm tx_cnt,1,1
	.comm cur_tx,1,1
	.comm cur_rx,1,1
	.comm cur_touch,1,1
	.comm cur_conf,1,1
	.comm cur_meas,2,1
.Letext0:
	.file 2 "/opt/cross/avr/bin/../lib/gcc/avr/4.6.2/../../../../avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1a0
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF20
	.byte	0x1
	.long	.LASF21
	.long	.LASF22
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
	.byte	0x1
	.long	.LASF9
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x6
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.byte	0x26
	.byte	0x1
	.long	0x42
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x7
	.byte	0x1
	.long	.LASF10
	.byte	0x1
	.byte	0x84
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.long	.LLST0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.byte	0x91
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST1
	.uleb128 0x5
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0xb7
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x8
	.long	.LASF13
	.byte	0x1
	.byte	0x23
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0x8
	.long	.LASF14
	.byte	0x1
	.byte	0x23
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0x8
	.long	.LASF15
	.byte	0x1
	.byte	0x24
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0x8
	.long	.LASF16
	.byte	0x1
	.byte	0x24
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0x8
	.long	.LASF17
	.byte	0x1
	.byte	0x24
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0x9
	.long	.LASF18
	.byte	0x1
	.byte	0x22
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_meas
	.uleb128 0x9
	.long	.LASF13
	.byte	0x1
	.byte	0x23
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_conf
	.uleb128 0x9
	.long	.LASF14
	.byte	0x1
	.byte	0x23
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_touch
	.uleb128 0x9
	.long	.LASF15
	.byte	0x1
	.byte	0x24
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_rx
	.uleb128 0x9
	.long	.LASF16
	.byte	0x1
	.byte	0x24
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_tx
	.uleb128 0x9
	.long	.LASF17
	.byte	0x1
	.byte	0x24
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx_cnt
	.uleb128 0x9
	.long	.LASF19
	.byte	0x1
	.byte	0xb3
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	meas_flag
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB8
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
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI3
	.long	.LFE8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	0
	.long	0
.LLST1:
	.long	.LFB9
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI9
	.long	.LFE9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
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
.LASF19:
	.string	"meas_flag"
.LASF9:
	.string	"init"
.LASF15:
	.string	"cur_rx"
.LASF16:
	.string	"cur_tx"
.LASF22:
	.string	"/home/tomv/workspace/attiny10_touch/"
.LASF1:
	.string	"unsigned char"
.LASF6:
	.string	"long unsigned int"
.LASF20:
	.string	"GNU C 4.6.2"
.LASF23:
	.string	"main"
.LASF17:
	.string	"tx_cnt"
.LASF4:
	.string	"unsigned int"
.LASF18:
	.string	"cur_meas"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF14:
	.string	"cur_touch"
.LASF13:
	.string	"cur_conf"
.LASF7:
	.string	"long long int"
.LASF21:
	.string	"main.c"
.LASF10:
	.string	"__vector_1"
.LASF3:
	.string	"uint16_t"
.LASF12:
	.string	"__vector_4"
.LASF11:
	.string	"__vector_6"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
