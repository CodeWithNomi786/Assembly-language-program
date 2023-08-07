;FRIDGE CODE WITH NOMI
.MODEL SMALL
.STACK 100H
.DATA
ISOPEN DB ? ;VAR INDICATE THE FRIDGE IS OPEN=1 OR CLOSE=1
CUR_TEM DB ? ;VAR FOR HOLDING THE CURRENT TEMP OF FRIDGE
TAR_TEM DB 6 ;VAR TARGET TEM
OPEN DB 10,13,'THE FRIDGE IS OPEN...!!$'
CLOSE DB 10,13,'THE FRIDGE IS CLOSE...!!$'
MSG_CUR DB 10,13,'THE CURRENT TEMPERATURE IS:$'
MSG_TAR DB 10,13,'THE TARGET TEMPERATURE IS :$' 
MSG_ADJUST DB 10,13,'ADJUSTING THE TEMPERATURE...!!$'
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV ISOPEN,1
    MOV DX,OFFSET OPEN
    MOV AH,9
    INT 21H 
    ;SET THE INITIAL VALUE OF TEMP
    
    MOV CUR_TEM,8 
    ;NOW DISPLAY PRINT THE CUR AND TEARGET TEMP
    MOV DX,OFFSET MSG_CUR
    MOV AH,9
    INT 21H
    
    MOV AL,CUR_TEM
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H
    
    MOV DX,OFFSET MSG_TAR
    MOV AH,9
    INT 21H
    MOV AL,TAR_TEM
    ADD AL,30H  
    MOV DL,AL
    MOV AH,2
    INT 21H
    
    MOV DX,OFFSET MSG_ADJUST
    MOV AH,9
    INT 21H
    
    MOV ISOPEN,0
    MOV DX,OFFSET CLOSE
    MOV AH,9
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP 
END MAIN
