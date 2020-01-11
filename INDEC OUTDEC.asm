;DECIMAL TO EQIVALENT BINARY NO 

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA  
SUM DW 0
.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    
   
    
    LOOP1:   
    MOV AH,1
    INT 21H 
    CMP AL,0DH
    JE END_LOOP1
    
    AND AL,0FH
    
    XOR AH,AH
    
    MOV BX,AX
    
    MOV AX,10

    MUL SUM
    
    ADD BX,AX
    
    MOV SUM,BX
    
    JMP LOOP1 
    
    END_LOOP1:
    PRINTN   
    
    
    MOV CX,0
    
    MOV AX,BX
    MOV BX,10
    
    LOOP2:
    XOR DX,DX 
    CMP AX,0
    JE ENDL

    DIV BX
    
    PUSH DX
    INC CX

    JMP LOOP2
    
    ENDL:
    
    LOOP3:
    POP DX
    ADD DX,48
    MOV AH,2
    INT 21H
    LOOP LOOP3
    
    
        
        
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN
        
        
    
    
    