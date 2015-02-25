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
	.loc 1 161 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 164 0
	out 55-0,__zero_reg__
	.loc 1 165 0
	out 57-0,__zero_reg__
	.loc 1 166 0
	out 54-0,__zero_reg__
	.loc 1 171 0
	out 46-0,__zero_reg__
	.loc 1 172 0
	out 45-0,__zero_reg__
	.loc 1 173 0
	ldi r24,lo8(7)
	out 43-0,r24
	.loc 1 176 0
	ldi r24,lo8(208)
	ldi r25,hi8(208)
	out 38+1-0,r25
	out 38-0,r24
	.loc 1 185 0
	sts sample_state,__zero_reg__
/* epilogue start */
	.loc 1 187 0
	ret
	.cfi_endproc
.LFE8:
	.size	init, .-init
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB6:
	.loc 1 69 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 71 0
	rcall init
.LBB4:
.LBB5:
	.loc 1 114 0
	lds r27,rx_in
	.loc 1 115 0
	lds r28,cur_rx_pos
	ldi r29,lo8(0)
	.loc 1 106 0
	mov r18,r27
	ldi r19,lo8(0)
	.loc 1 126 0
	lds r21,cur_tx_pos
	lds r23,rx_state
	lds r30,rx_nr_recv
	lds r26,cur_rx
	lds r22,tx_state
	lds r31,tx_nr_sent
	.loc 1 115 0
	subi r28,lo8(-(rx))
	sbci r29,hi8(-(rx))
	rjmp .L15
.L12:
	.loc 1 148 0
	ldi r22,lo8(0)
.L15:
	.loc 1 92 0 discriminator 1
	cpi r23,lo8(1)
	breq .L8
	cpi r23,lo8(1)
	brlo .L7
	cpi r23,lo8(4)
	brne .L6
	rjmp .L16
.L7:
	.loc 1 95 0
	tst r27
	brne .L6
	.loc 1 98 0
	ldi r26,lo8(0)
	.loc 1 97 0
	ldi r30,lo8(0)
	.loc 1 96 0
	ldi r23,lo8(1)
	rjmp .L6
.L8:
	.loc 1 104 0
	subi r30,lo8(-(1))
	.loc 1 106 0
	mov r24,r18
	mov r25,r19
	mov r16,r30
	rjmp 2f
1:	lsl r24
	rol r25
2:	dec r16
	brpl 1b
	or r26,r24
	.loc 1 108 0
	cpi r30,lo8(8)
	brne .L6
	.loc 1 109 0
	ldi r23,lo8(4)
	rjmp .L6
.L16:
	.loc 1 114 0
	tst r27
	breq .L6
	.loc 1 115 0
	st Y,r26
	.loc 1 116 0
	ldi r23,lo8(0)
.L6:
	.loc 1 123 0
	cpi r22,lo8(2)
	breq .L11
	cpi r22,lo8(4)
	breq .L12
	tst r22
	brne .L15
	.loc 1 126 0
	tst r21
	breq .L15
	.loc 1 129 0
	ldi r31,lo8(0)
	.loc 1 128 0
	ldi r22,lo8(2)
	rjmp .L15
.L11:
	.loc 1 137 0
	subi r31,lo8(-(1))
	.loc 1 141 0
	cpi r31,lo8(8)
	brne .L15
	.loc 1 142 0
	ldi r22,lo8(4)
	rjmp .L15
.LBE5:
.LBE4:
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.text
.global	__vector_1
	.type	__vector_1, @function
__vector_1:
.LFB9:
	.loc 1 205 0
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
	.loc 1 206 0
	in r24,40-0
	in r25,40+1-0
	subi r24,lo8(-(208))
	sbci r25,hi8(-(208))
	out 38+1-0,r25
	out 38-0,r24
/* epilogue start */
	.loc 1 208 0
	pop r25
	pop r24
	pop r16
	out __SREG__,r16
	pop r16
	pop r17
	reti
	.cfi_endproc
.LFE9:
	.size	__vector_1, .-__vector_1
.global	__vector_4
	.type	__vector_4, @function
__vector_4:
.LFB10:
	.loc 1 212 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 215 0
/* #APP */
 ;  215 "main.c" 1
	push r24
 ;  0 "" 2
	.loc 1 216 0
 ;  216 "main.c" 1
	ldi r24,lo8(2)
 ;  0 "" 2
	.loc 1 217 0
 ;  217 "main.c" 1
	out 1,r24
 ;  0 "" 2
	.loc 1 218 0
 ;  218 "main.c" 1
	pop r24
 ;  0 "" 2
	.loc 1 219 0
 ;  219 "main.c" 1
	reti
 ;  0 "" 2
/* epilogue start */
	.loc 1 220 0
/* #NOAPP */
	.cfi_endproc
.LFE10:
	.size	__vector_4, .-__vector_4
.global	__vector_6
	.type	__vector_6, @function
__vector_6:
.LFB11:
	.loc 1 224 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 227 0
/* #APP */
 ;  227 "main.c" 1
	push r24
 ;  0 "" 2
	.loc 1 230 0
/* #NOAPP */
	lds r24,bit_nr
	out 43-0,r24
	.loc 1 231 0
/* #APP */
 ;  231 "main.c" 1
	pop r24
 ;  0 "" 2
	.loc 1 232 0
 ;  232 "main.c" 1
	reti
 ;  0 "" 2
/* epilogue start */
	.loc 1 233 0
/* #NOAPP */
	.cfi_endproc
.LFE11:
	.size	__vector_6, .-__vector_6
.global	__vector_5
	.type	__vector_5, @function
__vector_5:
.LFB12:
	.loc 1 237 0
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
	push r24
.LCFI6:
	.cfi_def_cfa_offset 5
	.cfi_offset 24, -4
	push r25
.LCFI7:
	.cfi_def_cfa_offset 6
	.cfi_offset 25, -5
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	.loc 1 240 0
	in r24,0-0
	andi r24,lo8(1)
	sts rx_in,r24
	.loc 1 242 0
	lds r24,tx_out
	tst r24
	breq .L21
	.loc 1 243 0
	sbi 2-0,1
	rjmp .L22
.L21:
	.loc 1 245 0
	cbi 2-0,1
.L22:
	.loc 1 248 0
	in r24,38-0
	in r25,38+1-0
	subi r24,lo8(-(417))
	sbci r25,hi8(-(417))
	out 38+1-0,r25
	out 38-0,r24
	.loc 1 252 0
	sbi 18-0,0
/* epilogue start */
	.loc 1 253 0
	pop r25
	pop r24
	pop r16
	out __SREG__,r16
	pop r16
	pop r17
	reti
	.cfi_endproc
.LFE12:
	.size	__vector_5, .-__vector_5
	.comm cur_tx_pos,1,1
	.comm cur_rx_pos,1,1
	.comm tx_nr_sent,1,1
	.comm rx_nr_recv,1,1
	.comm tx_out,1,1
	.comm cur_tx,1,1
	.comm cur_rx,1,1
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
	.long	0x30d
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF33
	.byte	0x1
	.long	.LASF34
	.long	.LASF35
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
	.long	.LASF36
	.byte	0x1
	.byte	0x56
	.byte	0x1
	.byte	0x3
	.uleb128 0x8
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0xa1
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x9
	.byte	0x1
	.long	.LASF37
	.byte	0x1
	.byte	0x45
	.byte	0x1
	.long	0x42
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	0xf8
	.uleb128 0xa
	.long	0xad
	.long	.LBB4
	.long	.LBE4
	.byte	0x1
	.byte	0x4b
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0xcd
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0xd4
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x8
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.byte	0xe0
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0xb
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0xed
	.byte	0x1
	.long	.LFB12
	.long	.LFE12
	.long	.LLST1
	.uleb128 0xc
	.long	.LASF20
	.byte	0x1
	.byte	0x13
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.long	0x30
	.long	0x169
	.uleb128 0xe
	.long	0x54
	.byte	0x3
	.byte	0
	.uleb128 0xf
	.string	"rx"
	.byte	0x1
	.byte	0x31
	.long	0x159
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF21
	.byte	0x1
	.byte	0x33
	.long	0xa2
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF22
	.byte	0x1
	.byte	0x34
	.long	0xa2
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF23
	.byte	0x1
	.byte	0x36
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF24
	.byte	0x1
	.byte	0x37
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF25
	.byte	0x1
	.byte	0x38
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF26
	.byte	0x1
	.byte	0x39
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF27
	.byte	0x1
	.byte	0x3a
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF28
	.byte	0x1
	.byte	0x3b
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF29
	.byte	0x1
	.byte	0x3c
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF30
	.byte	0x1
	.byte	0x3d
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF31
	.byte	0x1
	.byte	0x3e
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.long	.LASF32
	.byte	0x1
	.byte	0x12
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_meas
	.uleb128 0x10
	.long	.LASF20
	.byte	0x1
	.byte	0x13
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	sample_state
	.uleb128 0x11
	.string	"tx"
	.byte	0x1
	.byte	0x30
	.long	0x159
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx
	.uleb128 0x11
	.string	"rx"
	.byte	0x1
	.byte	0x31
	.long	0x159
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	rx
	.uleb128 0x10
	.long	.LASF21
	.byte	0x1
	.byte	0x33
	.long	0xa2
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	rx_state
	.uleb128 0x10
	.long	.LASF22
	.byte	0x1
	.byte	0x34
	.long	0xa2
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx_state
	.uleb128 0x10
	.long	.LASF23
	.byte	0x1
	.byte	0x36
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	bit_nr
	.uleb128 0x10
	.long	.LASF24
	.byte	0x1
	.byte	0x37
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	rx_in
	.uleb128 0x10
	.long	.LASF25
	.byte	0x1
	.byte	0x38
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_rx
	.uleb128 0x10
	.long	.LASF26
	.byte	0x1
	.byte	0x39
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_tx
	.uleb128 0x10
	.long	.LASF27
	.byte	0x1
	.byte	0x3a
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx_out
	.uleb128 0x10
	.long	.LASF28
	.byte	0x1
	.byte	0x3b
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	rx_nr_recv
	.uleb128 0x10
	.long	.LASF29
	.byte	0x1
	.byte	0x3c
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx_nr_sent
	.uleb128 0x10
	.long	.LASF30
	.byte	0x1
	.byte	0x3d
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_rx_pos
	.uleb128 0x10
	.long	.LASF31
	.byte	0x1
	.byte	0x3e
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_tx_pos
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
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x3c
	.uleb128 0xc
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.long	.LFE9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	0
	.long	0
.LLST1:
	.long	.LFB12
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
	.long	.LFE12
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
.LASF29:
	.string	"tx_nr_sent"
.LASF36:
	.string	"handle_uart_io"
.LASF9:
	.string	"IDLE"
.LASF15:
	.string	"init"
.LASF11:
	.string	"SENDING"
.LASF25:
	.string	"cur_rx"
.LASF24:
	.string	"rx_in"
.LASF26:
	.string	"cur_tx"
.LASF35:
	.string	"/home/tomv/workspace/attiny10_touch/"
.LASF1:
	.string	"unsigned char"
.LASF6:
	.string	"long unsigned int"
.LASF27:
	.string	"tx_out"
.LASF20:
	.string	"sample_state"
.LASF33:
	.string	"GNU C 4.6.2"
.LASF12:
	.string	"START"
.LASF22:
	.string	"tx_state"
.LASF14:
	.string	"uart_state_t"
.LASF10:
	.string	"RECEIVING"
.LASF37:
	.string	"main"
.LASF13:
	.string	"STOP"
.LASF4:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF30:
	.string	"cur_rx_pos"
.LASF32:
	.string	"cur_meas"
.LASF7:
	.string	"long long int"
.LASF34:
	.string	"main.c"
.LASF23:
	.string	"bit_nr"
.LASF28:
	.string	"rx_nr_recv"
.LASF16:
	.string	"__vector_1"
.LASF3:
	.string	"uint16_t"
.LASF17:
	.string	"__vector_4"
.LASF19:
	.string	"__vector_5"
.LASF18:
	.string	"__vector_6"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF31:
	.string	"cur_tx_pos"
.LASF21:
	.string	"rx_state"
