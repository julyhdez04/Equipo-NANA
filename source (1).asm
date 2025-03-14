;Versión 2.0.2

	JMP boot ;Saltar al inicio del programa
stackTop EQU 0x02DF ;Definir el puntero con posición hexadecimal
texto EQU 0x2E0	 ;Definir etiqueta de texto en celda con posición hexadecimal
pantalla EQU 0x300 Definir etiqueta de display en celda con posición hexadecimal
findelapantalla EQU 0x400 ;Definir tamaño del display (final) en celda con posición hexadecimal
pantalla2 EQU 0x350 ;Definir etiqueta de segundo display en celda con posición hexadecimal
gatos:
DB "Miau miau miau  miau miau mew :3" ;Definir byte de texto a mostrar
        DB 0 ;Finalizar texto
;Definir bytes para la animación con bytes de colores
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\x01\x01\xC4"
DB "\xC4\xC4\x01\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\x01\xFF\x01"
DB "\x01\x01\xFF\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\x01\xC4\xC4\x01\x01\x01\x01"
DB "\x01\x01\x01\xC4\x01\xC4\xC4\xC4"
DB "\x01\xC4\xC4\xC4\xC4\x01\x01\xFC"
DB "\x01\x01\xFC\x01\xC4\xC4\xC4\xC4"
DB "\x01\xC4\xC4\xC4\x01\x01\x01\x01"
DB "\x01\x01\x01\xC4\x01\xC4\xC4\xC4"
DB "\x01\xC4\xC4\xC4\xC4\xC4\xFF\xFF"
DB "\xFF\xFF\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\x01\xC4\xC4\xC4\x01\x01\xFF"
DB "\xFF\xFF\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\x01\x01\x01\x01\x01\x01"
DB "\xFF\x01\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\x01\x01\x01\x01\xFF\x01"
DB "\x01\x01\xFF\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\xC4\xC4\xC4\xC4\xC4\xC4"
		DB 0		
DB "\xC4\xC4\x01\xC4\x01\x01\x01\x01"
DB "\x01\x01\x01\xC4\x01\xC4\xC4\xC4"
DB "\xC4\x01\xC4\xC4\xC4\x01\x01\xFC"
DB "\x01\x01\xFC\x01\xC4\xC4\xC4\xC4"
DB "\xC4\x01\xC4\xC4\x01\x01\x01\x01"
DB "\x01\x01\x01\xC4\x01\xC4\xC4\xC4"
DB "\xC4\x01\xC4\xC4\xC4\xC4\xFF\xFF"
DB "\xFF\xFF\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\x01\xC4\xC4\x01\x01\xFF"
DB "\xFF\xFF\xC4\xC4\xC4\xC4\xC4\xC4"
		DB 0
DB "\xC4\x01\xC4\xC4\x01\x01\x01\x01"
DB "\x01\x01\x01\xC4\x01\xC4\xC4\xC4"
DB "\xC4\xC4\x01\xC4\xC4\x01\x01\xFC"
DB "\x01\x01\xFC\x01\xC4\xC4\xC4\xC4"
DB "\xC4\xC4\x01\xC4\x01\x01\x01\x01"
DB "\x01\x01\x01\xC4\x01\xC4\xC4\xC4"
DB "\xC4\xC4\x01\xC4\xC4\xC4\xFF\xFF"
DB "\xFF\xFF\xC4\xC4\xC4\xC4\xC4\xC4"
DB "\xC4\x01\xC4\xC4\xC4\x01\x01\xFF"
DB "\xFF\xFF\xC4\xC4\xC4\xC4\xC4\xC4"
        	DB 0
delay EQU 1 ;

boot:	;Inicio de ejecución del programa			
	MOV SP, stackTop ;Mover SP a la posición del puntero	 
	MOV C, gatos ;Mover C a posición definida en "gatos"
	MOV D, texto ;Mover D a posición definida en "texto"
	CALL .loop ;Llamar la función loop (bucle) para su ejecución		
	HLT ;Finalizar programa		

.loop:		;Inicia el bucle		
	MOVB AL, [C]	;Sobreescribir "AL" en la posición de C
	MOVB [D], AL	;Sobreescribir D en la posición de AL de la línea anterior
	INC C ;Incrementar C para mover la posición
	INC D ;Incrementar D para mover la posición
	CMPB BL, [C] ;Comparar el valor de BL con C
	JNZ .loop ;Condicional, si no se cumple la comparación, retornar a loop, si si se cumple, continuar	
	MOV D, pantalla ;Mover D a la posición establecida en "pantalla"
    INC C ;Incrementar C para mover la posición
    CALL .loop2	;Llamar la función loop2
    CALL boot ;Llamar la función boot
    RET ;Retornar
   
.loop2:
	MOVB AL, [C] ;Mover AL a la posición de C	
	MOVB [D], AL ;Mover D a la posición de AL
	INC C ;Incrementar C para mover la posición
	INC D;Incrementar D para mover la posición
	CMP D,findelapantalla ;Comparar D  con "findelapantalla" si no se cumple, retornar
    JNZ .loop2 ;Regresar a loop2 si no se cumple la condición anterior
    MOV D, delay ;Mover D a la posición de "delay"
    INC C ;Incrementar C para mover la posición
    CALL .loopDELAY ;Llamar a la función de delay del bucle
    RET ;Retornar
    
.loopDELAY:
    INC B ;Incrementa el valor de B
    CMP B, D ;Compara el valor de B con D 
    JNZ .loopDELAY ;Si el valor de B no es igual a D, regresa al .loopDELAY y si es igual sigue
    MOV D, pantalla2 ;Mueve D a la posición de "pantalla2"
    MOV B, 0 ;Mueve B a la posición 0
    CALL .loop22 ;llama a la funcion .loop22
    RET ;Retorna al CALL que llamo la función .loopDELAY

.loop22:
	MOVB AL, [C]
    MOVB [D], AL
    INC C
    INC D 
    CMPB BL, [C]
    JNZ .loop22
    MOV D, pantalla2
    INC C
    CALL .loop222
    RET
.loop222:
	MOVB AL, [C]	
	MOVB [D], AL	
	INC C
	INC D
	CMPB BL, [C]
    JNZ .loop222
    INC C
    RET
    

    
