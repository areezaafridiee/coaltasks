
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data 
msg DB 'Enter first number: $'
msg1 DB 'Enter second number: $'
.code
main proc 
    mov ax,@data
    mov ds,ax
    mov dl,msg
    mov dx,offset msg
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov ax,bx 
    
    mov ah,10
    int 21h
    
    mov ax,@data
    mov ds,ax
    mov dl,msg
    mov dx,offset msg
    mov ah,9
    int 21h 
     
    mov ah,1
    int 21h 
    mov cx,dx
    
    mov dl,42
    mov ah,2
    int 21h
    mov dl,61
    mov ah,2
    int 21h
    
    mov dx,ax
    add dx,48
    mov ah,2
    int 21h
    mov ah,4ch
    main endp
end main

ret




