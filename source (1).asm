;Versión 1.2.0 

	JMP boot	;Con la función JMP realizamos un salto a la posición que le indiquemos en el argumento
			;en este caso hasta la zona de "boot" con el fin de evitar que lea las definiciones que
			;se realicen antes de dicha zona especificada.

stackTop    EQU 0xFF    ;EQU significa equivalente a algo, 0x definimos que lo siguiente se encuentra en el sistema
			;hexadecimal en este caso se refiere a la posición que queremos que inicie el puntero de pila
			;en la linea queremos que inice en el punto más alto de la memoria
txtDisplay  EQU 0x2E0	;Tambien definimos una ubicación pero en este caso es del texto

caritas:
		DB "Ola profe aquí los mas cabrones."
        DB 0
		DB "++++"	;caritas almacena como una variable todo lo que queremos imprimir
		DB 0		;DB definimos el byte 
		DB "////"	;Nuesto DB0 lo tomamos como nulo/espacio/vacío/terminado
		DB 0
       	 	DB "----"
        	DB 0
delay EQU 250

boot:				;Aquí ya incia a leer
	MOV SP, stackTop	;Inicia el puntero de pila en la dirección indicada 
	MOV C, caritas		;Apunta el registro c al inicio del texto al primer caracter del mesaje
	MOV D, txtDisplay	;Apunta el registro d a la dirección donde se imprime el primer texto
	CALL .loop		;CALL es igual a llamar la función en este caso imprimir 
	HLT			;Detiene la ejecución despues de la impresion primera pero nuestro codigo reinicia el ciclo

.loop:				;Genera un ciclo dentro del código
	MOVB AL, [C]	
	MOVB [D], AL	
	INC C
	INC D
	CMPB BL, [C]	
	JNZ .loop		
	MOV D, txtDisplay
    INC C
    CALL .loop2	
    CALL boot
    RET
   
.loop2:
	MOVB AL, [C]	
	MOVB [D], AL	
	INC C
	INC D
	CMPB BL, [C]	
    JNZ .loop2
    MOV D, delay
    INC C
    CALL .loopDELAY
    RET
    
.loopDELAY:
    INC B
    CMP B, D
    JNZ .loopDELAY
    MOV D, txtDisplay
    MOV B, 0
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
    
