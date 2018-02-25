;
; Program26.asm
;
; Created: 24/2/2561 18:37:45
; Author : TimeStoper
;unsigned short timesx2(unsigned short a)
;{
;	if (a < 0x1234)
;		return a>>1  ; 16-bit right shift
;	else
;		return 0xFFFF;
;}

;int main()
;{
;		unsigned short x, y;
;		x = 1000;
;		y = timesx2(x);
;}

.include "m328pdef.inc"

.def var_xl = r16
.def var_xh = r17
.def var_yl = r18
.def var_yh = r19
.def var_al = r20
.def var_ah = r21
.def resl = r22
.def resh = r23

.cseg
.org 0x00
	rjmp Main

Main :  ldi var_xl , low(1000)
		ldi var_xh , high(1000)
		movw var_al,var_xl
		rcall timesx2
		movw var_yl,resl
		rjmp END

timesx2 : push var_yl
		  push var_yh
		  ldi var_yl,0xff
		  ldi var_yh,0xff
		  cpi var_ah,0x12
		  breq Low_check
		  rjmp False

Low_check : cpi var_al,0x34
			brlo Shift_It
			rjmp False

Shift_It : lsr var_ah
		   ror var_al 
		   movw resl,var_al
		   ret 

False : mov var_al,var_yl
		mov var_ah,var_yh
		movw resl,var_al
		rjmp Returns

Returns : pop var_yh
		  pop var_yl
		  ret

END : rjmp END

.dseg
.eseg