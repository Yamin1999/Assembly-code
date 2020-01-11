include "emu8086.inc"
.model small
.stack 100h
.data
 SUM DW 0   
 REMAINING DW 0
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
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
    PRINT 'HOUR:  '
    MOV AX,BX
    MOV BX,3600
    DIV BX 
    MOV REMAINING,DX
    CALL OUTDEC
    PRINTN
    PRINT 'MINUTE:  '

    XOR DX,DX
    
    MOV AX,REMAINING 
    MOV BX,60
    DIV BX   
    MOV REMAINING,DX
    CALL OUTDEC
    
      PRINTN
    PRINT 'SECOND:  '

    XOR DX,DX

    MOV AX,REMAINING 
    MOV BX,1
    DIV BX   
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
        
        
    
    
    
    
