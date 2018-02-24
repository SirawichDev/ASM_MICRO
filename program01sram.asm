;
; Program01
;
; Created: 2/24/2018 9:19:08 AM
; Author : 5635512124
;


; Replace with your application code
.include"m328pdef.inc"
.def VAR_I = r16
.def VAR_J = r17
.def VAR_K = r18

.cseg
.org	0x00
	ldi xl,low(ptn_i)
	ldi xh,high(ptn_i)
	ld	VAR_I,x+
	ld	VAR_J,x+
	ld	VAR_K,x+

	ldi VAR_I,3
	ldi VAR_J,12
	ldi VAR_K,20
	mov VAR_I,VAR_J
	add VAR_I,VAR_K
	inc VAR_K
	mov VAR_J,VAR_K
	subi VAR_J,5

STORE : ldi zl,low(ptn_j)
		ldi zh,high(ptn_j)
		st z+,VAR_I

END:	rjmp END
.dseg
.org 0x100
ptn_i : .byte 1
ptn_j : .byte 1
ptn_k : .byte 1
.eseg
