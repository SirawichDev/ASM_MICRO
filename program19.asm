;program 19

.include"m328pdef.inc"
.def var_a = r16
.def var_b = r17
.def var_I = r18
.def temp = r21

.cseg
.org 0x00

	ldi var_a,15
	ldi var_b,1
	ldi var_I,0
	ldi temp,3

WHILE:	cp var_b,var_a
	brlt loop
	rjmp endloop

loop: muls var_b,temp
	mov var_b,r0
	inc var_I
	rjmp WHILE
endloop:

END: rjmp END
.dseg
.eseg
