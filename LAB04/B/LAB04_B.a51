; LAB 04B - USING 8051 I/O PORTS

ORG 0000H
; VARIABLES
; ----------
SWITCH EQU P1 	;P1 is the switch
LED EQU P2		; P2 is the LEDS
	
	; INTALIZIE PORTS
	; ---------------
	MOV SWITCH, #0FFH; INITALIZE PORT
	MOV LED, #0FFH
START:
	MOV A, SWITCH		; 
	ANL A, #00001111B	; GET LOWER NIBBLE
	MOV B, A			; STORE NIBBLE INTO B
	SWAP A				; SWAP NIBBLES
	
	CLR A				; RESET A
	
	MOV A, SWITCH
	
	SWAP A				; SWAP NIBBLE
	ANL A, #00001111B	; GET UPPER NIBBLE
	
	ADD A,B				; ADD NIBBLES TOGETHER
	
	MOV LED, A			; SEND TO LED
	
	SJMP START
		
		
		END
