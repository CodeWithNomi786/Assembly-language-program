;PROGRAM TO SORT ARRAY IN ASCENDING ORDER       
INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
ARR DB 5 DUP(?)
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    MOV BX,OFFSET ARR
    MOV CX,5  
    PRINT 'ENTER 5 NUMBERS IN ARRAY :'
    CALL ENTKEY
    INPUTS:
    MOV AH,1
    INT 21H
    MOV [BX],AL
    INC BX
    LOOP INPUTS
    
    ;FOR COMPARINSON OF NUMBERS
    MOV CX,5       
    DEC CX
    OUTERLOOP:
    MOV BX,CX
    MOV SI,0
    COMLOOP:
    MOV AL,ARR[SI]   
    MOV DL,ARR[SI+1]
    CMP AL,DL
    ;IF CARRY OCCUR MEAN 1ST NUMBER IS LESSER THEN SECOND SO NO SWAP REQUIRED     
    JC NOSWAP  
    ;IF YOU WANT TO SORT IN DECENDING ORDER THEN SIMPLY CHANGE THE JC WITH JNC
    MOV ARR[SI],DL
    MOV ARR[SI+1],AL
    NOSWAP:
    INC SI
    DEC BX
    JNZ COMLOOP 
    LOOP OUTERLOOP    
    
    ;FOR DISPLAY ARRAY AFTER SORTING
    MOV CX,5
    MOV BX,OFFSET ARR   
    CALL ENTKEY
    PRINT 'AFTER SORTING THE GIVEN ARRAY IS :'
    CALL ENTKEY
    DISPLAY:
    MOV DL,[BX]
    MOV AH,2
    INT 21H
    INC BX      
    MOV DL,32
    MOV AH,2
    INT 21H
    LOOP DISPLAY
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
ENTKEY PROC
    MOV DL,10
    MOV AH,2
    INT 21H
    MOV DL,13
    MOV AH,2
    INT 21H
    RET 
    ENTKEY ENDP
END MAIN
    