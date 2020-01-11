;DECIMAL TO BINARY

INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA  
SUM DW 0
.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    
   
    PRINT 'ENTER A DECIMAL NUMBER:  '
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
    PRINT 'EQUIVALENT BINARY NUMBER:  ' 
    
    MOV CX,16 
    
    
    
    WHILE:
    
    SHL BX,1
    JC CARRY
    
    PRINT '0'
    JMP ENDK
    
    CARRY:
    PRINT '1'
    
    ENDK:
    LOOP WHILE
    

MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
        
    