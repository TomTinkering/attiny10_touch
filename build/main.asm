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
	.loc 1 130 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 132 0
/* #APP */
 ;  132 "main.c" 1
	cli
 ;  0 "" 2
	.loc 1 136 0
/* #NOAPP */
	out 55-0,__zero_reg__
	.loc 1 137 0
	out 57-0,__zero_reg__
	.loc 1 138 0
	out 54-0,__zero_reg__
	.loc 1 144 0
	out 46-0,__zero_reg__
	.loc 1 145 0
	ldi r24,lo8(-64)
	out 45-0,r24
	.loc 1 147 0
	out 43-0,__zero_reg__
	.loc 1 155 0
	ldi r24,lo8(-86)
	sts cur_rx,r24
	.loc 1 157 0
	in r24,43-0
	ori r24,lo8(1)
	out 43-0,r24
	.loc 1 158 0
	in r24,45-0
	ori r24,lo8(1)
	out 45-0,r24
	.loc 1 159 0
/* #APP */
 ;  159 "main.c" 1
	sei
 ;  0 "" 2
/* epilogue start */
	.loc 1 161 0
/* #NOAPP */
	ret
	.cfi_endproc
.LFE7:
	.size	init, .-init
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB6:
	.loc 1 74 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 76 0
	rcall init
	.loc 1 98 0
	ldi r22,lo8(1)
.L12:
	.loc 1 81 0
	sbis 19-0,0
	rjmp .L4
	.loc 1 81 0 is_stmt 0 discriminator 1
	in __tmp_reg__,43-0
	sbrs __tmp_reg__,2
	rjmp .L4
	.loc 1 85 0 is_stmt 1
	lds r24,cur_rx
	sbrs r24,7
	rjmp .L5
	.loc 1 85 0 is_stmt 0 discriminator 1
	lds r25,state
	sbrs r25,7
	rjmp .L5
	.loc 1 87 0 is_stmt 1
	sts cur_conf,r24
	.loc 1 88 0
	mov r23,r25
	andi r23,lo8(4)
	ori r24,lo8(-128)
	or r23,r24
	sts cur_tx,r23
	.loc 1 90 0
	andi r25,lo8(123)
	sts state,r25
	rjmp .L6
.L5:
	.loc 1 94 0
	sts cur_tx,r24
.L6:
	.loc 1 98 0
	out 20-0,r22
	.loc 1 99 0
	out 19-0,r22
.L4:
	.loc 1 104 0
	in r24,40-0
	in r25,40+1-0
	ldi r23,hi8(-25536)
	cpi r24,lo8(-25536)
	cpc r25,r23
	brlo .L7
	.loc 1 106 0
	in r24,43-0
	andi r24,lo8(1)
	out 43-0,r24
	.loc 1 108 0
	sbi 1-0,1
	.loc 1 112 0
	in r24,43-0
	ori r24,lo8(1)
	out 43-0,r24
.L7:
	.loc 1 117 0
	lds r24,state
	ldi r25,lo8(0)
	sbrc r24,0
	rjmp .L8
	.loc 1 74 0 discriminator 1
	andi r24,lo8(6)
	andi r25,hi8(6)
	.loc 1 117 0 discriminator 1
	cpi r24,6
	cpc r25,__zero_reg__
	brne .L12
.L8:
	.loc 1 118 0
	lds r24,led_val
	out 39-0,r24
	.loc 1 119 0
	out 38-0,__zero_reg__
	rjmp .L12
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.text
.global	__vector_1
	.type	__vector_1, @function
__vector_1:
.LFB8:
	.loc 1 173 0
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
	.loc 1 176 0
/* #APP */
 ;  176 "main.c" 1
	sei
 ;  0 "" 2
	.loc 1 179 0
/* #NOAPP */
	in r24,40-0
	in r25,40+1-0
	subi r24,lo8(-(403))
	sbci r25,hi8(-(403))
	out 38+1-0,r25
	out 38-0,r24
	.loc 1 181 0
	out 19-0,__zero_reg__
	.loc 1 182 0
	in r24,43-0
	ori r24,lo8(4)
	out 43-0,r24
/* epilogue start */
	.loc 1 184 0
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
	.loc 1 187 0
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
	.loc 1 190 0
/* #APP */
 ;  190 "main.c" 1
	sei
 ;  0 "" 2
	.loc 1 193 0
/* #NOAPP */
	in r24,38-0
	in r25,38+1-0
	subi r24,lo8(-(194))
	sbci r25,hi8(-(194))
	out 38+1-0,r25
	out 38-0,r24
	.loc 1 196 0
	lds r24,tx_cnt
	tst r24
	brne .L15
	.loc 1 198 0
	cbi 2-0,3
	.loc 1 200 0
	ldi r24,lo8(1)
	sts tx_cnt,r24
	rjmp .L14
.L15:
	.loc 1 201 0
	cpi r24,lo8(9)
	brsh .L17
	.loc 1 203 0
	in r24,0-0
	lsr r24
	lsr r24
	andi r24,lo8(1)
	lds r25,cur_rx
	or r24,r25
	.loc 1 204 0
	lsl r24
	sts cur_rx,r24
	.loc 1 206 0
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
	.loc 1 207 0
	lsr r23
	sts cur_tx,r23
	rjmp .L14
.L17:
	.loc 1 211 0
	sbi 2-0,3
	.loc 1 214 0
	in r24,43-0
	andi r24,lo8(-5)
	out 43-0,r24
	.loc 1 216 0
	sts tx_cnt,__zero_reg__
.L14:
/* epilogue start */
	.loc 1 219 0
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
	.loc 1 233 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 237 0
/* #APP */
 ;  237 "main.c" 1
	cbi 2,0
 ;  0 "" 2
	.loc 1 238 0
 ;  238 "main.c" 1
	cbi 1,1
 ;  0 "" 2
	.loc 1 239 0
 ;  239 "main.c" 1
	reti
 ;  0 "" 2
/* epilogue start */
	.loc 1 240 0
/* #NOAPP */
	.cfi_endproc
.LFE10:
	.size	__vector_4, .-__vector_4
.global	__vector_5
	.type	__vector_5, @function
__vector_5:
.LFB11:
	.loc 1 246 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 250 0
/* #APP */
 ;  250 "main.c" 1
	sbi 2,0
 ;  0 "" 2
	.loc 1 251 0
 ;  251 "main.c" 1
	reti
 ;  0 "" 2
/* epilogue start */
	.loc 1 252 0
/* #NOAPP */
	.cfi_endproc
.LFE11:
	.size	__vector_5, .-__vector_5
	.comm led_val,1,1
	.comm state,1,1
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
	.long	0x24e
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF40
	.byte	0x1
	.long	.LASF41
	.long	.LASF42
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
	.long	.LASF17
	.byte	0x1
	.byte	0x1
	.byte	0xe
	.long	0xb4
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
	.uleb128 0x6
	.long	.LASF14
	.sleb128 5
	.uleb128 0x6
	.long	.LASF15
	.sleb128 6
	.uleb128 0x6
	.long	.LASF16
	.sleb128 7
	.byte	0
	.uleb128 0x5
	.long	.LASF18
	.byte	0x1
	.byte	0x1
	.byte	0x1b
	.long	0xf1
	.uleb128 0x6
	.long	.LASF19
	.sleb128 0
	.uleb128 0x6
	.long	.LASF20
	.sleb128 1
	.uleb128 0x6
	.long	.LASF21
	.sleb128 2
	.uleb128 0x6
	.long	.LASF22
	.sleb128 3
	.uleb128 0x6
	.long	.LASF23
	.sleb128 4
	.uleb128 0x6
	.long	.LASF24
	.sleb128 5
	.uleb128 0x6
	.long	.LASF25
	.sleb128 6
	.uleb128 0x6
	.long	.LASF26
	.sleb128 7
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.byte	0x82
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x8
	.byte	0x1
	.long	.LASF43
	.byte	0x1
	.byte	0x4a
	.byte	0x1
	.long	0x42
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x9
	.byte	0x1
	.long	.LASF28
	.byte	0x1
	.byte	0xad
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.long	.LLST0
	.uleb128 0x9
	.byte	0x1
	.long	.LASF29
	.byte	0x1
	.byte	0xbb
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST1
	.uleb128 0x7
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.byte	0xe9
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x7
	.byte	0x1
	.long	.LASF31
	.byte	0x1
	.byte	0xf6
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0xa
	.long	.LASF32
	.byte	0x1
	.byte	0x44
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.long	.LASF33
	.byte	0x1
	.byte	0x45
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.long	.LASF34
	.byte	0x1
	.byte	0x45
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.long	.LASF35
	.byte	0x1
	.byte	0x45
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.long	.LASF36
	.byte	0x1
	.byte	0x46
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.long	.LASF37
	.byte	0x1
	.byte	0x47
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF38
	.byte	0x1
	.byte	0x43
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_meas
	.uleb128 0xb
	.long	.LASF32
	.byte	0x1
	.byte	0x44
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_conf
	.uleb128 0xb
	.long	.LASF39
	.byte	0x1
	.byte	0x44
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_touch
	.uleb128 0xb
	.long	.LASF33
	.byte	0x1
	.byte	0x45
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_rx
	.uleb128 0xb
	.long	.LASF34
	.byte	0x1
	.byte	0x45
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_tx
	.uleb128 0xb
	.long	.LASF35
	.byte	0x1
	.byte	0x45
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx_cnt
	.uleb128 0xb
	.long	.LASF36
	.byte	0x1
	.byte	0x46
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	state
	.uleb128 0xb
	.long	.LASF37
	.byte	0x1
	.byte	0x47
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	led_val
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xa
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
.LASF21:
	.string	"MSG_IS_TOUCHED"
.LASF36:
	.string	"state"
.LASF19:
	.string	"MSG_LED_EN"
.LASF20:
	.string	"MSG_LED_DIRECT"
.LASF37:
	.string	"led_val"
.LASF27:
	.string	"init"
.LASF12:
	.string	"RESERVED0"
.LASF13:
	.string	"RESERVED1"
.LASF14:
	.string	"RESERVED2"
.LASF15:
	.string	"RESERVED3"
.LASF33:
	.string	"cur_rx"
.LASF34:
	.string	"cur_tx"
.LASF42:
	.string	"/home/tomv/workspace/attiny10_touch/"
.LASF1:
	.string	"unsigned char"
.LASF28:
	.string	"__vector_1"
.LASF6:
	.string	"long unsigned int"
.LASF9:
	.string	"LED_EN"
.LASF30:
	.string	"__vector_4"
.LASF40:
	.string	"GNU C 4.6.2"
.LASF17:
	.string	"state_t"
.LASF26:
	.string	"MSG_SLOT_TAKEN"
.LASF11:
	.string	"TOUCHED"
.LASF43:
	.string	"main"
.LASF10:
	.string	"SET_LED_DIRECT"
.LASF35:
	.string	"tx_cnt"
.LASF24:
	.string	"MSG_RESERVED2"
.LASF4:
	.string	"unsigned int"
.LASF38:
	.string	"cur_meas"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF39:
	.string	"cur_touch"
.LASF18:
	.string	"msg_t"
.LASF32:
	.string	"cur_conf"
.LASF7:
	.string	"long long int"
.LASF41:
	.string	"main.c"
.LASF22:
	.string	"MSG_RESERVED0"
.LASF23:
	.string	"MSG_RESERVED1"
.LASF3:
	.string	"uint16_t"
.LASF25:
	.string	"MSG_RESERVED3"
.LASF16:
	.string	"TAKEN_PASSED"
.LASF31:
	.string	"__vector_5"
.LASF29:
	.string	"__vector_6"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
