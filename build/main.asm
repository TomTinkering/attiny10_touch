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
	.loc 1 191 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 193 0
/* #APP */
 ;  193 "main.c" 1
	cli
 ;  0 "" 2
	.loc 1 196 0
/* #NOAPP */
	ldi r24,lo8(-40)
	out 60-0,r24
	.loc 1 197 0
	out 54-0,__zero_reg__
	.loc 1 198 0
	out 55-0,__zero_reg__
	.loc 1 201 0
	ldi r24,lo8(9)
	out 2-0,r24
	.loc 1 202 0
	ldi r24,lo8(11)
	out 1-0,r24
	.loc 1 203 0
	ldi r24,lo8(4)
	out 3-0,r24
	.loc 1 209 0
	out 46-0,__zero_reg__
	.loc 1 210 0
	ldi r24,lo8(-64)
	out 45-0,r24
	.loc 1 212 0
	out 43-0,__zero_reg__
	.loc 1 213 0
	out 40+1-0,__zero_reg__
	out 40-0,__zero_reg__
	.loc 1 218 0
	ldi r24,lo8(-86)
	sts cur_rx,r24
	.loc 1 220 0
	in r24,43-0
	ori r24,lo8(1)
	out 43-0,r24
	.loc 1 221 0
	in r24,45-0
	ori r24,lo8(1)
	out 45-0,r24
	.loc 1 222 0
/* #APP */
 ;  222 "main.c" 1
	sei
 ;  0 "" 2
/* epilogue start */
	.loc 1 224 0
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
	.loc 1 109 0
	.cfi_startproc
	push r28
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
	rcall .
	rcall .
	rcall .
.LCFI2:
	.cfi_def_cfa_offset 10
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI3:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 6 */
/* stack size = 8 */
.L__stack_usage = 8
	.loc 1 111 0
	rcall init
	.loc 1 137 0
	ldi r18,lo8(1)
	.loc 1 129 0
	ldi r30,lo8(-1)
	.loc 1 158 0
	ldi r19,lo8(2)
.L15:
	.loc 1 116 0
	sbic 19-0,0
	rjmp .L4
	.loc 1 116 0 is_stmt 0 discriminator 1
	in __tmp_reg__,43-0
	sbrc __tmp_reg__,2
	rjmp .L4
	.loc 1 118 0 is_stmt 1
/* #APP */
 ;  118 "main.c" 1
	nop
 ;  0 "" 2
	.loc 1 120 0
/* #NOAPP */
	lds r24,cur_rx
	sbrs r24,0
	rjmp .L5
	.loc 1 120 0 is_stmt 0 discriminator 1
	lds r25,state
	sbrs r25,0
	rjmp .L5
	.loc 1 123 0 is_stmt 1
	andi r25,lo8(25)
	mov r22,r24
	andi r22,lo8(-26)
	or r25,r22
	.loc 1 124 0
	mov r22,r25
	andi r22,lo8(8)
	ori r24,lo8(1)
	or r22,r24
	sts cur_tx,r22
	.loc 1 126 0
	andi r25,lo8(-10)
	sts state,r25
	.loc 1 128 0
	ori r25,lo8(31)
	out 39-0,r25
	.loc 1 129 0
	out 38-0,r30
	rjmp .L6
.L5:
	.loc 1 133 0
	sts cur_tx,r24
.L6:
	.loc 1 137 0
	out 20-0,r18
	.loc 1 138 0
	out 19-0,r18
	.loc 1 139 0
/* #APP */
 ;  139 "main.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	rjmp .L15
.L4:
	.loc 1 148 0
	in r24,40-0
	in r25,40+1-0
	ldi r20,hi8(-25536)
	cpi r24,lo8(-25536)
	cpc r25,r20
	brsh .+2
	rjmp .L8
	.loc 1 151 0
	in __tmp_reg__,42-0
	sbrs __tmp_reg__,5
	rjmp .L14
	.loc 1 151 0 is_stmt 0 discriminator 1
	in r22,34-0
	in r23,34+1-0
	subi r28,lo8(-(5+2))
	sbci r29,hi8(-(5+2))
	st -Y,r23
	st -Y,r22
	subi r28,lo8(5)
	sbci r29,hi8(5)
	rjmp .L9
.L14:
	.loc 1 151 0
	ldi r24,lo8(-25536)
	ldi r25,hi8(-25536)
	subi r28,lo8(-(5+2))
	sbci r29,hi8(-(5+2))
	st -Y,r25
	st -Y,r24
	subi r28,lo8(5)
	sbci r29,hi8(5)
.L9:
	.loc 1 151 0 discriminator 3
	subi r28,lo8(-(5))
	sbci r29,hi8(-(5))
	ld r26,Y+
	ld r27,Y
	subi r28,lo8(5+1)
	sbci r29,hi8(5+1)
	sts touch_new+1,r27
	sts touch_new,r26
	.loc 1 153 0 is_stmt 1 discriminator 3
	mov r20,r26
	mov r21,r27
	ldi r22,lo8(0)
	ldi r23,hi8(0)
	subi r28,lo8(-(1))
	sbci r29,hi8(-(1))
	st Y+,r20
	st Y+,r21
	st Y+,r22
	st Y,r23
	subi r28,lo8(1+3)
	sbci r29,hi8(1+3)
	lds r20,touch_avg
	lds r21,touch_avg+1
	ldi r22,lo8(0)
	ldi r23,hi8(0)
	mov r27,r23
	mov r26,r22
	mov r25,r21
	mov r24,r20
	ldi r31,5
1:	lsl r24
	rol r25
	rol r26
	rol r27
	dec r31
	brne 1b
	sub r24,r20
	sbc r25,r21
	sbc r26,r22
	sbc r27,r23
	subi r28,lo8(-(1))
	sbci r29,hi8(-(1))
	ld r20,Y+
	ld r21,Y+
	ld r22,Y+
	ld r23,Y
	subi r28,lo8(1+3)
	sbci r29,hi8(1+3)
	add r20,r24
	adc r21,r25
	adc r22,r26
	adc r23,r27
	ldi r31,5
1:	lsl r20
	rol r21
	rol r22
	rol r23
	dec r31
	brne 1b
	ldi r31,10
1:	lsr r23
	ror r22
	ror r21
	ror r20
	dec r31
	brne 1b
	subi r28,lo8(-(1))
	sbci r29,hi8(-(1))
	st Y+,r20
	st Y+,r21
	st Y+,r22
	st Y,r23
	subi r28,lo8(1+3)
	sbci r29,hi8(1+3)
	sts touch_avg+1,r21
	sts touch_avg,r20
	.loc 1 155 0 discriminator 3
	subi r28,lo8(-(1))
	sbci r29,hi8(-(1))
	ld r24,Y+
	ld r25,Y
	subi r28,lo8(1+1)
	sbci r29,hi8(1+1)
	subi r24,lo8(-(512))
	sbci r25,hi8(-(512))
	subi r28,lo8(-(5))
	sbci r29,hi8(-(5))
	ld r22,Y+
	ld r23,Y
	subi r28,lo8(5+1)
	sbci r29,hi8(5+1)
	cp r24,r22
	cpc r25,r23
	brsh .L10
	.loc 1 156 0
	lds r24,touch_cnt
	subi r24,lo8(-(1))
	sts touch_cnt,r24
	.loc 1 157 0
	cpi r24,lo8(2)
	brlo .L11
	.loc 1 158 0
	sts touch_cnt,r19
	.loc 1 159 0
	lds r24,state
	ori r24,lo8(8)
	sts state,r24
	rjmp .L11
.L10:
	.loc 1 162 0
	sts touch_cnt,__zero_reg__
.L11:
	.loc 1 166 0
	in r24,42-0
	ori r24,lo8(32)
	out 42-0,r24
	.loc 1 167 0
	cbi 2-0,1
	.loc 1 168 0
	sbi 1-0,1
.L8:
	.loc 1 172 0
	lds r24,state
	ldi r25,lo8(0)
	sbrc r24,1
	rjmp .L12
	.loc 1 109 0 discriminator 1
	andi r24,lo8(12)
	andi r25,hi8(12)
	.loc 1 172 0 discriminator 1
	cpi r24,12
	cpc r25,__zero_reg__
	brne .L13
.L12:
	.loc 1 174 0
	sbi 1-0,0
	.loc 1 175 0
	cbi 3-0,0
	rjmp .L15
.L13:
	.loc 1 178 0
	cbi 1-0,0
	.loc 1 179 0
	sbi 3-0,0
	rjmp .L15
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.text
.global	__vector_1
	.type	__vector_1, @function
__vector_1:
.LFB8:
	.loc 1 236 0
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
	.loc 1 239 0
/* #APP */
 ;  239 "main.c" 1
	sei
 ;  0 "" 2
	.loc 1 242 0
/* #NOAPP */
	in r24,40-0
	in r25,40+1-0
	subi r24,lo8(-(403))
	sbci r25,hi8(-(403))
	out 38+1-0,r25
	out 38-0,r24
	.loc 1 244 0
	out 19-0,__zero_reg__
	.loc 1 245 0
	in r24,43-0
	ori r24,lo8(4)
	out 43-0,r24
/* epilogue start */
	.loc 1 247 0
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
	.loc 1 250 0
	.cfi_startproc
	push r17
.LCFI8:
	.cfi_def_cfa_offset 3
	.cfi_offset 17, -2
	push r16
.LCFI9:
	.cfi_def_cfa_offset 4
	.cfi_offset 16, -3
	in r16,__SREG__
	push r16
	ldi __zero_reg__,lo8(0)
	push r22
.LCFI10:
	.cfi_def_cfa_offset 5
	.cfi_offset 22, -4
	push r23
.LCFI11:
	.cfi_def_cfa_offset 6
	.cfi_offset 23, -5
	push r24
.LCFI12:
	.cfi_def_cfa_offset 7
	.cfi_offset 24, -6
	push r25
.LCFI13:
	.cfi_def_cfa_offset 8
	.cfi_offset 25, -7
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	.loc 1 253 0
/* #APP */
 ;  253 "main.c" 1
	sei
 ;  0 "" 2
	.loc 1 256 0
/* #NOAPP */
	in r24,38-0
	in r25,38+1-0
	subi r24,lo8(-(194))
	sbci r25,hi8(-(194))
	out 38+1-0,r25
	out 38-0,r24
	.loc 1 259 0
	lds r24,tx_cnt
	tst r24
	brne .L18
	.loc 1 261 0
	cbi 2-0,3
	.loc 1 263 0
	ldi r24,lo8(1)
	sts tx_cnt,r24
	rjmp .L17
.L18:
	.loc 1 264 0
	cpi r24,lo8(9)
	brsh .L20
	.loc 1 266 0
	in r24,0-0
	lsr r24
	lsr r24
	andi r24,lo8(1)
	lds r25,cur_rx
	or r24,r25
	.loc 1 267 0
	lsl r24
	sts cur_rx,r24
	.loc 1 269 0
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
	.loc 1 270 0
	lsr r23
	sts cur_tx,r23
	rjmp .L17
.L20:
	.loc 1 274 0
	sbi 2-0,3
	.loc 1 277 0
	in r24,43-0
	andi r24,lo8(-5)
	out 43-0,r24
	.loc 1 279 0
	sts tx_cnt,__zero_reg__
.L17:
/* epilogue start */
	.loc 1 282 0
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
	.loc 1 296 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 300 0
/* #APP */
 ;  300 "main.c" 1
	cbi 2,0
 ;  0 "" 2
	.loc 1 301 0
 ;  301 "main.c" 1
	cbi 1,1
 ;  0 "" 2
	.loc 1 302 0
 ;  302 "main.c" 1
	reti
 ;  0 "" 2
/* epilogue start */
	.loc 1 303 0
/* #NOAPP */
	.cfi_endproc
.LFE10:
	.size	__vector_4, .-__vector_4
.global	__vector_5
	.type	__vector_5, @function
__vector_5:
.LFB11:
	.loc 1 309 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 313 0
/* #APP */
 ;  313 "main.c" 1
	sbi 2,0
 ;  0 "" 2
	.loc 1 314 0
 ;  314 "main.c" 1
	reti
 ;  0 "" 2
/* epilogue start */
	.loc 1 315 0
/* #NOAPP */
	.cfi_endproc
.LFE11:
	.size	__vector_5, .-__vector_5
	.comm touch_avg,2,1
	.comm touch_new,2,1
	.comm touch_cnt,1,1
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
	.long	0x29e
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF44
	.byte	0x1
	.long	.LASF45
	.long	.LASF46
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
	.uleb128 0x3
	.long	.LASF6
	.byte	0x2
	.byte	0x7e
	.long	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF18
	.byte	0x1
	.byte	0x1
	.byte	0xf
	.long	0xbf
	.uleb128 0x6
	.long	.LASF10
	.sleb128 0
	.uleb128 0x6
	.long	.LASF11
	.sleb128 1
	.uleb128 0x6
	.long	.LASF12
	.sleb128 2
	.uleb128 0x6
	.long	.LASF13
	.sleb128 3
	.uleb128 0x6
	.long	.LASF14
	.sleb128 4
	.uleb128 0x6
	.long	.LASF15
	.sleb128 5
	.uleb128 0x6
	.long	.LASF16
	.sleb128 6
	.uleb128 0x6
	.long	.LASF17
	.sleb128 7
	.byte	0
	.uleb128 0x5
	.long	.LASF19
	.byte	0x1
	.byte	0x1
	.byte	0x1c
	.long	0xfc
	.uleb128 0x6
	.long	.LASF20
	.sleb128 0
	.uleb128 0x6
	.long	.LASF21
	.sleb128 1
	.uleb128 0x6
	.long	.LASF22
	.sleb128 2
	.uleb128 0x6
	.long	.LASF23
	.sleb128 3
	.uleb128 0x6
	.long	.LASF24
	.sleb128 4
	.uleb128 0x6
	.long	.LASF25
	.sleb128 5
	.uleb128 0x6
	.long	.LASF26
	.sleb128 6
	.uleb128 0x6
	.long	.LASF27
	.sleb128 7
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF28
	.byte	0x1
	.byte	0xbf
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0x8
	.byte	0x1
	.long	.LASF47
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.long	0x42
	.long	.LFB6
	.long	.LFE6
	.long	.LLST0
	.uleb128 0x9
	.byte	0x1
	.long	.LASF29
	.byte	0x1
	.byte	0xec
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.long	.LLST1
	.uleb128 0x9
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.byte	0xfa
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST2
	.uleb128 0xa
	.byte	0x1
	.long	.LASF31
	.byte	0x1
	.word	0x128
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0xa
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.word	0x135
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.uleb128 0xb
	.long	.LASF33
	.byte	0x1
	.byte	0x63
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF34
	.byte	0x1
	.byte	0x63
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF35
	.byte	0x1
	.byte	0x63
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF36
	.byte	0x1
	.byte	0x64
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF37
	.byte	0x1
	.byte	0x67
	.long	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF38
	.byte	0x1
	.byte	0x68
	.long	0x49
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	.LASF39
	.byte	0x1
	.byte	0x69
	.long	0x49
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	.LASF40
	.byte	0x1
	.byte	0x61
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_meas
	.uleb128 0xc
	.long	.LASF41
	.byte	0x1
	.byte	0x62
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_conf
	.uleb128 0xc
	.long	.LASF42
	.byte	0x1
	.byte	0x62
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_touch
	.uleb128 0xc
	.long	.LASF33
	.byte	0x1
	.byte	0x63
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_rx
	.uleb128 0xc
	.long	.LASF34
	.byte	0x1
	.byte	0x63
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cur_tx
	.uleb128 0xc
	.long	.LASF35
	.byte	0x1
	.byte	0x63
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tx_cnt
	.uleb128 0xc
	.long	.LASF36
	.byte	0x1
	.byte	0x64
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	state
	.uleb128 0xc
	.long	.LASF43
	.byte	0x1
	.byte	0x65
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	led_val
	.uleb128 0xc
	.long	.LASF37
	.byte	0x1
	.byte	0x67
	.long	0x30
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	touch_cnt
	.uleb128 0xc
	.long	.LASF38
	.byte	0x1
	.byte	0x68
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	touch_new
	.uleb128 0xc
	.long	.LASF39
	.byte	0x1
	.byte	0x69
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	touch_avg
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
	.uleb128 0x6
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
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB6
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
	.sleb128 10
	.long	.LCFI3
	.long	.LFE6
	.word	0x2
	.byte	0x8c
	.sleb128 10
	.long	0
	.long	0
.LLST1:
	.long	.LFB8
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
	.long	.LFE8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	0
	.long	0
.LLST2:
	.long	.LFB9
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI13
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
.LASF23:
	.string	"MSG_IS_TOUCHED"
.LASF36:
	.string	"state"
.LASF37:
	.string	"touch_cnt"
.LASF21:
	.string	"MSG_LED_EN"
.LASF22:
	.string	"MSG_LED_DIRECT"
.LASF43:
	.string	"led_val"
.LASF28:
	.string	"init"
.LASF33:
	.string	"cur_rx"
.LASF34:
	.string	"cur_tx"
.LASF25:
	.string	"MSG_LED0"
.LASF46:
	.string	"/home/tomv/workspace/attiny10_touch/"
.LASF27:
	.string	"MSG_LED2"
.LASF1:
	.string	"unsigned char"
.LASF7:
	.string	"long unsigned int"
.LASF11:
	.string	"LED_EN"
.LASF31:
	.string	"__vector_4"
.LASF32:
	.string	"__vector_5"
.LASF44:
	.string	"GNU C 4.6.2"
.LASF18:
	.string	"state_t"
.LASF20:
	.string	"MSG_SLOT_TAKEN"
.LASF24:
	.string	"MSG_RESERVED"
.LASF13:
	.string	"TOUCHED"
.LASF14:
	.string	"RESERVED"
.LASF47:
	.string	"main"
.LASF12:
	.string	"SET_LED_DIRECT"
.LASF35:
	.string	"tx_cnt"
.LASF39:
	.string	"touch_avg"
.LASF4:
	.string	"unsigned int"
.LASF40:
	.string	"cur_meas"
.LASF9:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF42:
	.string	"cur_touch"
.LASF19:
	.string	"msg_t"
.LASF41:
	.string	"cur_conf"
.LASF8:
	.string	"long long int"
.LASF45:
	.string	"main.c"
.LASF15:
	.string	"LED0"
.LASF16:
	.string	"LED1"
.LASF17:
	.string	"LED2"
.LASF29:
	.string	"__vector_1"
.LASF3:
	.string	"uint16_t"
.LASF10:
	.string	"TAKEN_PASSED"
.LASF26:
	.string	"MSG_LED1"
.LASF30:
	.string	"__vector_6"
.LASF6:
	.string	"uint32_t"
.LASF5:
	.string	"long int"
.LASF38:
	.string	"touch_new"
.LASF0:
	.string	"signed char"
