;
; 
;
; Created: 2/24/2018 9:19:08 AM
; Author : 5635512124
;
	;Program09
 ;unsigned char b= 220;
 ;unsigned short a;
 ;a = (b*15)+500;
 .include"m328pdef.inc"
.def var_al = r16
.def var_ah = r17
.def var_b = r18
.def var_tmpl = r20
.def var_tmph = r21

.cseg
.org	0x00
		rjmp main

main:	
		mov var_al,var_b
		ldi var_tmpl,15
		mul var_al,var_tmpl
		movw var_al,r0
		ldi var_tmpl,low(500)
		ldi var_tmph,high(500)
		add var_al,var_tmpl
		adc var_ah,var_tmph
END:	rjmp END
.dseg
.eseg
