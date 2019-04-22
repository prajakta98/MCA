;DISPLAY DIGITS 0 TO 9 CONTINUOSLY EVERY 1 SEC ON A 7 SEG DIS.

ORG 70H
DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH ;LOOKUP TABLE 0-9
	
ORG 00H
MOV P1,#00H ;make port 1 as output port
L3:MOV R2,#0AH ;count of numbers in data block
   MOV DPTR,#70H ;starting address of data block
L: MOV A,#00H
   MOVC A,@A+DPTR
   INC DPTR
   MOV P1,A
   LCALL DELAY
DJNZ R2,L 
SJMP L3

DELAY:
    MOV TMOD,#10H ;timer 1 mode 1
	MOV R3,#10H ;gives delay of 1 sec ;loop runs 16 times; 1.04 secs delay
L2:	MOV TH1,#00H
	MOV TL1,#00H
	SETB TR1
L1: JNB TF1,L1 ;polling
	CLR TR1
	CLR TF1
DJNZ R3,L2
RET
END