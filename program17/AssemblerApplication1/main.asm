;
; AssemblerApplication1.asm
;
; Created: 2/22/2018 11:06:14 AM
; Author : 5635512124
;


; Replace with your application code
.include"m328pdef.inc"

.def var_a = r16
.def var_b = r17
.def var_cl = r18
.def var_ch = r19
.def tmp = r20

.cseg
.org 0x00
	rjmp main

main : ldi xl , low(point_a)
	   ldi xh, high(point_a)
	   ld var_a , x+
		ld var_b , x+
		ld var_cl , x+
		ld var_ch , x+
		clr tmp
IFSTATE : cp var_b,var_a
			brsh True
			rjmp FALSE

True : add var_cl , var_a
		adc var_ch,tmp
		rjmp STORE

FALSE : add var_cl , var_b
		adc var_ch,tmp

STORE : ldi zl, low(point_c)
		ldi zh, high(point_c)
		st z+,var_a
		st z+,var_b
		st z+,var_cl
		st z+,var_ch
END : rjmp END

.dseg
.org 0x10A

point_a  : .byte 1
point_b  : .byte 1
point_c  : .byte 2

.eseg
