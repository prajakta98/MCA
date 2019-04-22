;DISPLAY CURRENT YEAR 2019 ON MULTIPLEXED 7 SEGMENT DISPLAY

ORG 70H
DB 5BH,3FH,06H,6FH 
	
ORG 0000H
MOV P1,#00H ;,command words will be given to port 1
MOV P2,#00H ;P2.0->SEG1,P2.1->SEG2,P2.2->SEG3,P2.3->SEG4 
L: MOV R2,#0EEH ;
   MOV A,R2
   MOV DPTR,#70H ;start of data block
   MOV R3,#04H ;number of values in  data block
L1:
   MOV P2,A 
   MOV A,#00H
   MOVC A,@A+DPTR ;1st value of data block is moved to accumulator
   INC DPTR
   MOV P1,A ;1st value of data block is displayed on the 7 segment
   LCALL DELAY
   MOV A,R2 
   RL A
   MOV R2,A
   LCALL DELAY
   DJNZ R3,L1
   SJMP L
DELAY:
   MOV TMOD,#10H ;timer 1 mode 1
   MOV TH1,#0FCH ;gives a delay of 2 msec
   MOV TL1,#18H 
   SETB TR1
L3:JNB TF1,L3
   CLR TR1
   CLR TF1
RET
END