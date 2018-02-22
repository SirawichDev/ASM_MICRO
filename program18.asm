
;program18
.include "m328pdef.inc"
.def var_a = r16
.def var_b = r17
.def var_cl = r18
.def var_ch = r19
.def var_d = r20
.def temp = r21
;ให้เข้า loop เปลี่ยน ค่า a ให้มากกว่า b
.cseg
.org 0x00
	ldi var_cl ,1
	ldi var_ch ,0
	ldi var_a,1 
	ldi var_b,2
	ldi var_d,10

	ldi temp,5

loop : mul var_a,temp
		movw var_cl,r0
		sub var_d,var_b
		cp var_a,var_b
		brsh loop

END : rjmp END

.dseg
.eseg
