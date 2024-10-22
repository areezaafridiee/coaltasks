
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
msg1 DB 10,13, "Enter First Number:$"
msg2 DB 10,13, "Enter Second Number:$"
msg3 DB 10,13, "Numbers are Equal:$"
msg4 DB 10,13, "Numbers are not Equal:$"
.code
main proc
mov ax, @data
mov dx, ax
mov dx, offset msg1
mov ah, 9
int 21h
mov ah, 1
int 21h
mov cl, al
mov dx, offset msg2
mov ah, 9
int 21h
mov ah, 1
int 21h
mov dl, al
cmp dl,cl ;compare the values which are in dl and cl, 6-6=0 if equal to 0 then jump
je label1 ; if equal move to label1 and print msg3
mov dx, offset msg4 ; if not equal then this statement will print msg4
mov ah, 9
int 21h
mov ah, 4ch
int 21h
label1:
mov dx, offset msg3
mov ah, 9
int 21h
mov ah, 4ch
int 21h
main endp
end main
ret




