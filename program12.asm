;
; 
;
; Created: 2/24/2018 9:19:08 AM
; Author : 5635512124
;
	;Program12
 ;signed char a, b, c;
	;	if (a<b)
;			c = -1;
;		else if (a > b)
;			c = 1;
;		else
 ;			c = 0;
;		a = b*c;

.include"m328pdef.inc"
.def var_a = r16
.def var_tmp =r17
.def var_b = r18
.def var_c = r19

.cseg
.org	0x00
		rjmp main

main:	
		ldi var_a,15
		ldi var_b,20
		cp var_a,var_b
		brlt c_negone
		rjmp elseif
c_negone : ldi var_c , -1
		rjmp endif

elseif: cp var_b,var_a
		brlt c_one
		rjmp else
c_one: ldi var_c,1
		rjmp endif

else: ldi var_c,0

endif: mul var_b,var_c
	   add var_a,r0
	   clr var_tmp
	   adc var_tmp,r1
END:	rjmp END
.dseg
.eseg
