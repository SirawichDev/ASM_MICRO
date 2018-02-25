	;
	; Program31.asm
	;
	; Created: 24/2/2561 18:37:45
	; Author : TimeStoper
	;algo
	; 0x3FF - 0x200 + 1 = 0x400 
	;0x400 = 1024
	;1024 > 255 => 8*128
		;for(i=0;i<8;i++){
		;for(j=0;j<128;j++){
			;if(z > -20 && z< 100)
			;y++
		;}
		;}	
	.include "m328pdef.inc"

	.def var_z = r16
	.def var_i = r17
	.def var_j = r18
	.def var_count = r20
	.def var_zero = r21
	.def tmp = r22

	.cseg
	.org 0x00
		rjmp Main
	Main : clr var_i
		   clr var_j
		   clr var_count
		   clr var_zero
		   ldi zl,low(pt_count)
		   ldi zh,high(pt_count)
		   ldi yl, 0
		   ldi yh, 0
	Loop_i:  cpi var_i,8
			brlo loop_j
			rjmp End_loopi
	Loop_j: cpi var_j,128
			brlo IF_LOOP
			inc var_i
			rjmp Loop_i

   IF_LOOP:  push tmp
		     ldi tmp,-20
			 ld var_z , z+
			 cp tmp,var_z
			 brlt next_check
			 rjmp End_Loopj

	next_check : cpi var_z ,100
				 brlt True
				 rjmp End_Loopj
		  True : inc var_count
				 rjmp STORE
	 End_Loopj : inc var_j
			     rjmp Loop_j

		  STORE: st y+,var_count
				 st y+,var_zero
				 pop tmp
				 rjmp End_Loopj

	End_loopi: rjmp End_loopi 

	.dseg 
	.org 0x100
	pt_sum: .BYTE 8*128

	.eseg
		  

