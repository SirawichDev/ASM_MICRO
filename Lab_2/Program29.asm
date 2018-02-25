	;
	; Program29.asm
	;
	; Created: 24/2/2561 18:37:45
	; Author : TimeStoper
	; 0x3FF - 0x100 + 1 = 0x2FF + 1 = 0x300
	; 0x300 = 3*16^2 = 768 => 4*192 
	;for(i=0;i<4;i++){
	;	for(j=0;j<192;j++){		
	;		ld var_tmp,z+
	;		if(var_tmp<0)
	;			x++
	;	}
	;}
	.include "m328pdef.inc"

	.def var_tmp = r16
	.def var_i = r17
	.def var_j = r18
	.def var_x = r19

	.cseg
	.org 0x00
		rjmp Main

	Main :  clr var_i
			clr var_j
			ldi zl,low(pt_count)
			ldi zh, high(pt_count)
			ldi xl, low(pt_count)
			ldi xh, low(pt_count)

	Loop_i : cpi var_i,4
			 brlo Loop_j
			 rjmp END_Loop    

	Loop_j : cpi var_j,192
			 brlo counters
			 rjmp END_J

	counters : ld var_tmp,z+
			  cpi var_tmp,0
			  brlo less_zero
			  inc var_j
			  rjmp Loop_j
	less_zero : inc var_x
				st x+,var_x
				inc var_j
				rjmp loop_j
	END_J : inc var_i
			rjmp loop_i

	END_Loop : rjmp END_Loop
	.dseg
	.org 0x100
	pt_count : .BYTE 192*4
	.eseg