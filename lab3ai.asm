;READ 10 DATA ELEMENTS,STORE THESE FROM 40H ONWARDS & COPY THEM FROM 50H ONWARDS 

ORG 0000H
MOV R0,#40H ;ADDRESS FOR STORING ELEMENTS
MOV R1,#50H ;ADDRESS FOR COPYING ELEMENTS
MOV R2,#0AH ;COUNT OF 10 ELEMENTS

L:MOV A,P1 ;LOOP TO ACCEPT 10 ELEMENT FROM PORT
MOV @R0,A ;STORING EACH ELEMENT FROM ADDRESS 40H
INC R0
DJNZ R2,L

MOV R0,#40H
MOV R2,#0AH

L1:MOV A,@R0 ;LOOP TO COPY 10 ELEMENTS
MOV @R1,A ;COPYING EACH ELEMENT
INC R0
INC R1
DJNZ R2,L1
S:SJMP S
END