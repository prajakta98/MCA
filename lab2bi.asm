;MULTIPLY AND DIVIDE TWO 8 BIT NUMBERS

ORG 00000H
MOV R1,P1
MOV R2,P2
MOV A,R1
MOV B,R2
MUL AB
MOV R5,A ;lower 8 bits
MOV R6,B ;higher 8 bits
MOV A,R1
MOV B,R2
DIV AB
MOV R3,A ;quotient
MOV R4,B ;remainder
S:SJMP S
END