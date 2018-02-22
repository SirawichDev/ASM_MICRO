;
; AssemblerApplication2.asm
;
; Created: 2/22/2018 11:33:25 AM
; Author : 5635512124
;


; Replace with your application code
;program17
.include"m328pdef.inc"
.def VAR_A = r16
.def var_b = r17
.def tmp = r20

.cseg
.org 0x00
	ldi var_b,0xff
	ldi var_a,30

for : cpi var_a,10
	  brsh loop
	  rjmp endloop
loop: lsl var_a 
	  add var_b,var_a
	  brcc endif
	  clr var_a
endif: dec var_a
	   rjmp for
endloop:
	inc var_a
END: rjmp END

.dseg
.eseg

