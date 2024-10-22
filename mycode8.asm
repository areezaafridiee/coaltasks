
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data
.code
main proc
    mov al,5
    mov bl,2
    mul bl
    AAM 
    mov ch,ah
    mov cl,al
    mov dl,ch
    add dx,48
    mov ah,2
    int 21h
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h
    mov ah,4ch
    main endp
end main

ret




