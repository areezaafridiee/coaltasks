.model small
.stack 100h
.data
msg DB 'You Entered $'
msg1 DB 'character $' 
.code
main Proc
    mov ax,@data
    mov ds,ax
    mov dl,msg
    mov dx,offset msg
    mov ah,9
    int 21h
     
    mov ah,1
    int 21h
    mov ax,bx
    
    mov ah,2
    int 21h
   
     
    mov ax,@data
    mov ds,ax
    mov dl,msg1
    mov dx,offset msg1
    mov ah,9
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main
    