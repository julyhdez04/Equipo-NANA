; Example 1.1:
; Writes "Hello World!" to the text display

	JMP boot

stackTop    EQU 0xFF    ; Initial SP
txtDisplay  EQU 0x2E0

hello:	DB "(*-*)"	; Output string
		DB 0				; String terminator
		DB "(*0*)"
		DB 0
        DB "(*~*)"
        DB 0
boot:
	MOV SP, stackTop	; Set SP
	MOV C, hello		; Point register C to string
	MOV D, txtDisplay	; Point register D to output
	CALL print
	HLT				; Halt execution

print:				; Print string

.loop:
	MOVB AL, [C]	; Get character
	MOVB [D], AL	; Write to output
	INC C
	INC D
	CMPB BL, [C]	; Check if string terminator
	JNZ .loop		; Jump back to loop if not
	MOV D, txtDisplay
    INC C
    CALL .loop2	
    CALL boot
    RET
   
.loop2:
	MOVB AL, [C]	; Get character
	MOVB [D], AL	; Write to output
	INC C
	INC D
	CMPB BL, [C]	
    JNZ .loop2
    MOV D, txtDisplay
    INC C
    CALL .loop22
    RET
.loop22:
	MOVB AL, [C]
    MOVB [D], AL
    INC C
    INC D 
    CMPB BL, [C]
    JNZ .loop22
    RET
    