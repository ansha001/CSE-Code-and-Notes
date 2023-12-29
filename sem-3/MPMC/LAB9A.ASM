; PROGRAM :: COMPUTE nCr USING RECURSIVE PROCEDURE. ASSUME THAT 'n' AND
; 'r' ARE NON-NEGATIVE INTEGERS.

.MODEL SMALL

.DATA
N DB 05H
R DB 02H
NCRVAL DW 01H DUP(?)

.CODE
START : MOV AX, @DATA
        MOV DS, AX
        MOV CL, R
        MOV CH, N
        XOR AX, AX
        CALL NCR
        MOV [NCRVAL], AX
        MOV AH, 4CH
        INT 21H

NCR PROC NEAR
        CMP CH, CL
        JE EQUAL                ; N==R? SET 1
        JC FINISH               ; N<R ? SET ZERO 
        CMP CL, 01H             ; R==1 ? SET N
        JE NEXT
        CMP CL,00H              ; R==0 ? SET 1
        JE EQUAL
        DEC CH
        PUSH CX
        CALL NCR
        POP CX
        DEC CL
        CALL NCR
        RET
NEXT :  XOR BX, BX
        MOV BL, CH
        ADD AX, BX
RET
EQUAL : ADD AX, 01H
FINISH :RET
NCR ENDP

END START
