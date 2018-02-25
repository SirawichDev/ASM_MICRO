	;
	; Program30.asm
	;
	; Created: 24/2/2561 18:37:45
	; Author : TimeStoper
	;algo
	; 0x3FF - 0x200 + 1 = 0x200 
	;0x200 = 512
	;512 > 255 => 4*128
		;for(i=0;i<4;i++){
		;for(j=0;j<128;j++){
			;ld var_tmp,z+
			;x=x+var_tmp
	.include "m328pdef.inc"

	.def var_tmp = r16
	.def var_i = r17
	.def var_j = r18
	.def var_xl = r20
	.def var_xh = r21
	.def zero = r22

	.cseg
	.org 0x00
		rjmp Main
	Main : clr var_i
		   clr var_j
		   clr zero
		   ldi zl,low(pt_sum)
		   ldi zh,high(pt_sum)
		   ldi xl, low(pt_sum)
		   ldi xh, high(pt_sum)
	Loop_i:  cpi var_i,4
			brlo loop_j
			rjmp End_loopi
	Loop_j: cpi var_j,128
			brlo sums
			inc var_i
			rjmp Loop_i
	sums: ld var_tmp, z+
		  add var_xl,var_tmp
		  adc var_xh,zero

	STORE:st x+,var_xl
		  st x+,var_xh
		  inc var_j
		  rjmp Loop_j
	End_loopi: rjmp End_loopi 

	.dseg 
	.org 0x200
	pt_sum: .BYTE 4*128

	.eseg
		  

