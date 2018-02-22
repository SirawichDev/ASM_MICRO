;
; program5.asm
;
; Created: 2/22/2018 12:07:37 PM
; Author : 5635512124
;


; Replace with your application code
.include "m328pdef.inc"
.DEF VAR_AL = R16
.DEF VAR_AH = R17
.DEF VAR_B = R18
.DEF VAR_C = R19
.cseg
.org	0x00
	ldi VAR_B,2
	ldi VAR_C,4
	mul VAR_B,VAR_C
	movw VAR_AL,R0
	

    ldi ZL,low(TMP_I)
	ldi ZH,high(TMP_I)
	
	st Z+,VAR_B
	st Z+,VAR_C
	st Z+,VAR_AL
	st Z+,VAR_AH

END:	rjmp END

.dseg
.org	0x100
TMP_I: .byte 1
TMP_J: .byte 1
TMP_K: .byte 1
.eseg