
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
msg DB 'Areeza Afridi$'
.code
main Proc
    mov ax,@data
    mov ds,ax
    mov dl,msg
    mov dx,offset msg
    
    mov ah,9
    int 21h
    mov ah,4ch
    main endp
end main

ret




