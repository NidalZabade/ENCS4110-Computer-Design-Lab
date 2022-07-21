	PRESERVE8
	THUMB
	
	AREA RESET, DATA, READONLY 
	EXPORT __Vectors

__Vectors
    DCD 0x20001000
	DCD Reset_Handler

	ALIGN


	
		
	AREA MYCODE, CODE, READONLY
    ENTRY 
	EXPORT Reset_Handler
		
Reset_Handler

	MOV R0, #1	;The value of x -> R0 = x
	ADD R2,R0, #1	; R2 = x + 1
	LSL R2, R2, #2	;R2 = 4(x + 1)
	LSL R1, R0, #4	;R1 = 16x
	TST R0,#1	;Check if x odd or even
	ADDEQ R2,R2,R1	;R2 = R2 + R1 = 4(x + 1) + 16x
	

	ALIGN 
STOP 
	B STOP 
 	END
