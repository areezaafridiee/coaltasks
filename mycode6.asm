
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
.code
main proc

 mov ah,1
 int 21h
 mov bx, ax ; inputing a small case alphabet

 sub bx,32 ; converting into its upper case
 mov dx,bx ; storing in data register

 mov ah,2
 int 21h


mov ah,4ch
int 21h
main endp
end main

ret




