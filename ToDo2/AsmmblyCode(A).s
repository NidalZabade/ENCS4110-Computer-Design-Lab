	PRESERVE8
	THUMB 
 
		AREA RESET, DATA, READONLY
		EXPORT __Vectors
__Vectors 
	DCD 0x20001000 ; stack pointer value when stack is empty
		DCD Reset_Handler ; reset vector
		ALIGN
First
	DCB "AHmade",0
Second
	DCB "Ahmad",0


	
	AREA MYMEMORY,DATA,READWRITE
first space 10
second space 10
	ALIGN
	
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
	

	
Reset_Handler
 	LDR R0, =First
	LDR R1, =Second
	MOV R5, #0
LOOP
	LDRB R2, [R0, R5] ; letter by letter from the first string
	LDRB R3, [R1, R5] ; letter by letter from the Second string
	ORR R2,R2,#32
	ORR R3,R3,#32
	ADD R5, #1
	CMP R2, R3
	BGT STORE_SECOND
	BLT STORE_FIRST
	CMP R2, #0
	BNE LOOP
	

	
STORE_FIRST ; STORE R0 in first and R1 in second.
	LDR R0, =First
	LDR R1, =Second
	LDR R6,=first
	LDR R7,=second
	MOV R5, #0
LOOP2
	LDRB R2, [R0, R5] ; letter by letter from the first string
	EOR R2,R2,#32
	ADD R5, #1
	STR R2,[R6],#1
	CMP R2, #32
	BNE LOOP2
	MOV R5, #32
LOOP4
	LDRB R3, [R1, R5] ; letter by letter from the first string
	EOR R3,R3,#32
	ADD R5, #1
	STR R3,[R7],#1
	CMP R3, #32
	BNE LOOP4
	B STOP
	
STORE_SECOND ; STORE R1 in first and R0 in second.
	LDR R0, =First
	LDR R1, =Second
	LDR R6,=first
	LDR R7,=second
	MOV R5, #0
LOOP5
	LDRB R3, [R1, R5] ; letter by letter from the first string
	EOR R3,R3,#32
	ADD R5, #1
	STR R3,[R7],#1
	CMP R3, #32
	BNE LOOP5
	MOV R5, #0
LOOP6
	LDRB R2, [R0, R5] ; letter by letter from the first string
	EOR R2,R2,#32
	ADD R5, #1
	STR R2,[R6],#1
	CMP R2, #32
	BNE LOOP6
	B STOP
	
	

	B STOP
	
STOP
	B STOP
	END ; End of the program
