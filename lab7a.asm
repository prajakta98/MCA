;TO DISPLAY "LAB509" ON LCD

ORG 0000H
MOV A,#38H ;INITIALIZE 2 LINE DISPLAY
ACALL COMMAND
MOV A,#0EH ;CURSOR ON,DISPLAY ON
ACALL COMMAND
MOV A,#01H ;CLEAR LCD COMMAND
ACALL COMMAND
MOV A,#06H ;SHIFT CURSOR RIGHT
ACALL COMMAND
MOV A,#86H ;CURSOR LINE 1
ACALL COMMAND

MOV A,#'L'
ACALL DATA_DISPLAY
ACALL DELAY
MOV A,#06H
MOV A,#'A'
ACALL DATA_DISPLAY
ACALL DELAY
MOV A,#06H
MOV A,#'B'
ACALL DATA_DISPLAY
ACALL DELAY
MOV A,#06H
MOV A,#'5'
ACALL DATA_DISPLAY
ACALL DELAY
MOV A,#06H
MOV A,#'0'
ACALL DATA_DISPLAY
ACALL DELAY
MOV A,#06H
MOV A,#'9'
ACALL DATA_DISPLAY
ACALL DELAY

COMMAND: ;FOR DISPLAYING
	MOV P1,A
	CLR P2.0  ;RS=0-->REGISTER SELECT-->COMMAND REGISTER
	CLR P2.1  ;RW=0-->WRITE OPERATION
	SETB P2.2 ;E=1-->ENABLE SIGNAL IS HIGH
	CLR P2.2 ;E=0-->ENABLE SIGNAL IS LOW
	ACALL DELAY
	SETB P2.2 ;E=1-->ENABLE SIGNAL IS HIGH
	RET
	
DATA_DISPLAY:
	MOV P1,A
	SETB P2.0 ;RS=1-->REGISTER SELECT-->DATA REGISTER
	CLR P2.1  ;RW=0-->WRITE OPERATION
	SETB P2.2 ;E=1-->ENABLE SIGNAL IS HIGH
	CLR P2.2  ;E=0-->ENABLE SIGNAL IS LOW
	ACALL DELAY
	SETB P2.2 ;E=1-->ENABLE SIGNAL IS HIGH
	RET

DELAY:
	MOV TMOD,#10H ;TIMER 0 MODE 1
	MOV TL1,#00H
	MOV TH1,#00H
	SETB TR1
	L: JNB TF1,L
	   CLR TR1
	   CLR TF1
	RET
END