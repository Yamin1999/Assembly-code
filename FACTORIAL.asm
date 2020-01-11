;FACTORIAL

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
.CODE


MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H 
    MOV AH,0
    AND AL,0FH
    MOV CX,AX
 
    MOV AX,1
    MOV BX,1
    
    LOOP1:
    MUL BX
    INC BX
    LOOP LOOP1
    PRINTN
    
   CALL OUTDEC
   
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP   



 OUTDEC PROC
     MOV CX,0     
    MOV BX,10
    
    LOOP2:
    XOR DX,DX 
    CMP AX,0
    JE ENNP
    JNE CONTI
    
    ENNP:
    CMP DX,0
    JE ENNK
    JNE ENDL
    
    ENNK:
    PUSH DX
    INC CX
    JMP ENDL
    
    CONTI:
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
    RET
    OUTDEC ENDP
 
        
END MAIN
        
        
    
    
    
    
