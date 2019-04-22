;SECONDS COUNTER WHICH COUNTS FROM 0 TO 59 AND AGAIN

ORG 0100H
			DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH
			ORG 0000H
			SJMP MAIN
			ORG 0040H
	MAIN:	MOV R1, #00H		; INDEDX FOR TENS PLACE
			MOV DPTR, #0100H	; START ADDRESS OF LOOK UP TABLE
	L2:		MOV R0,#00H			; R0-- INDEX FOR UNITS PLACE
	L3:		MOV R2, #0FAH		; R2-- 1 SEC COUNTER
	L1:		MOV A,R0			
			MOVC A, @A+DPTR		; getting command word for display
			MOV P1, A			
			CLR P2.0			; turning units place 7 segment ON
			ACALL DELAY			; delay of 100 milliseconds
			SETB P2.0			; turning units place 7 segment OFF
			MOV A,	R1			; mov index of tens place into A
			MOVC A,	@A+DPTR		; getting command word for tens place
			MOV P1,	A			
			CLR P2.1			; turning tens place 7 segment ON
			ACALL DELAY			; delay of 100 ms
			SETB P2.1			; tens place 7 segment off
			DJNZ R2, L1 		; check for 1 sec competion
			INC R0				; increase index for units place command word
			CJNE R0, #0AH, L3	; check for R0 becoming 10
			INC R1				; as R0 becomes 10, make R1 1 and R0=0
			CJNE R1, #6H, L2	; check for R1 becoming 10
			
			SJMP MAIN
	
	DELAY:	MOV R3, #02H		; only 2 cycles as 1 cycle is 1 milli sec, we need 2 milli sec
	BACK:	MOV TMOD, #01H		; timer 0, mode 1
			MOV TL0, #18H		
			MOV TH0, #0FCH
			SETB TR0			; start timer 0
	WAIT:	JNB TF0, WAIT		; polling
			CLR TR0
			CLR TF0
			DJNZ R3, BACK		
			RET
	END