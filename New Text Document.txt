;
; Program25.asm
;
; Created: 24/2/2561 18:37:45
; Author : TimeStoper
;
;int main()
;{
;	unsigned char i;
;	unsigned short NAME[20];
;	for (i=0;i<20;i++)
;   	NAME[i] = NAME[i]<<1;
;}

.include"328pdef.inc"
.def var_i = r16
.def var_namel =r18
.def var_nameh = r19
.def var_tmp = r20

.cseg
.org 0x00
	rjmp Main

Main : ldi xl,low(pt_name)
	   ldi xh,high(pt_name)
	   ld  var_namel,x+
	   ld  var_nameh,x+
	   clr var_i
Loop : cpi var_i,20
	   brlo True
	   rjmp END
True : rol var_namel
	   lsl var_nameh
	   ldi zl,low(pt_name)
	   ldi zh,high(pt_name)
	   st z+,var_namel
	   st z+,var_nameh
	   inc var_i
	   rjmp Loop

END : rjmp END

.dseg
.org 0x10A
pt_name : .BYTE 2*20

.eseg

