;READ TWO 16 BIT DATA, PERFORM MULTIPLICATION AND STORE RESULT IN SCRATCH PAD MEMORY
;IF NOT SCRATCH PAD MEMORY REPLACE 50H,51H,52H,53H BY R0,R5,R6,A RESPECTIVELY

ORG 0000H
MOV R1,P1
MOV R2,P1
MOV R3,P1
MOV R4,P1
MOV A,R2 ;LOWER BYTE OF 1ST NUMBER
MOV B,R4 ;LOWER BYTE OF 2ND NUMBER
MUL AB
MOV 50H,A ;LOWER BYTE OF RESULT OF R2 & R4 ;1ST BYTE OF RESULT
MOV R5,B ;HIGHER BYTE OF RESULT OF R2 & R4
MOV A,R1 ;HIGHER BYTE OF 1ST NUMBER
MOV B,R4 ;LOWER BYTE OF 2ND NUMBER
MUL AB
ADDC A,R5
MOV R5,A ;LOWER BYTE OF REULT OF R1 & R4 
MOV R6,B ;HIGHER BYTE OF REULT OF R1 & R4
MOV A,R2 ;LOWER BYTE OF 1ST NUMBER
MOV B,R3 ;HIGHER BYTE OF 2ND NUMBER
MUL AB
ADDC A,R5 
MOV 51H,A ;2ND BYTE OF RESULT
MOV R7,B ;HIGHER BYTE OF RESULT OF R2 & R3
MOV A,R1 ;HIGHER BYTE OF 1ST NUMBER
MOV B,R3 ;HIGHER BYTE OF 2ND NUMBER
MUL AB
ADDC A,R7 ;A IS LOWER BYTE OF RESULT OF R2 & R3
ADDC A,R6 
MOV 52H,A ;3RD BYTE OF RESULT
MOV A,#00H
ADDC A,B ;4TH BYTE OF RESULT
MOV 53H,A
S:SJMP S
END






