
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
    msg1 db 10,13, "Enter First Number (0-9): $"
    msg2 db 10,13, "Enter Second Number (0-9): $"
    msg_greater db 10,13, "A is greater than B", 0ah, 0dh, '$'
    msg_less db 10,13, "A is less than B", 0ah, 0dh, '$'
    msg_equal db 10,13, "A is equal to B", 0ah, 0dh, '$'

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Prompt user to enter the first number (A)
    mov dx, offset msg1   ; Load address of msg1 into DX
    mov ah, 9             ; DOS service to display string
    int 21h               ; Call DOS interrupt

    ; Read the first number (A) from the user
    mov ah, 1             ; DOS service to read a character from keyboard
    int 21h               ; Call DOS interrupt
    sub al, '0'           ; Convert ASCII to a number (0-9)
    mov bl, al            ; Store the value of A in BL

    ; Prompt user to enter the second number (B)
    mov dx, offset msg2   ; Load address of msg2 into DX
    mov ah, 9             ; DOS service to display string
    int 21h               ; Call DOS interrupt

    ; Read the second number (B) from the user
    mov ah, 1             ; DOS service to read a character from keyboard
    int 21h               ; Call DOS interrupt
    sub al, '0'           ; Convert ASCII to a number (0-9)
    mov bh, al            ; Store the value of B in BH

    ; Compare the values of A (in BL) and B (in BH)
    cmp bl, bh
    jg greater            ; If A > B, jump to 'greater'
    jl less               ; If A < B, jump to 'less'
    je equal              ; If A == B, jump to 'equal'

greater:
    ; Display "A is greater than B"
    mov dx, offset msg_greater
    mov ah, 9             ; DOS service to display string
    int 21h               ; Call DOS interrupt
    jmp done              ; Jump to done

less:
    ; Display "A is less than B"
    mov dx, offset msg_less
    mov ah, 9             ; DOS service to display string
    int 21h               ; Call DOS interrupt
    jmp done              ; Jump to done

equal:
    ; Display "A is equal to B"
    mov dx, offset msg_equal
    mov ah, 9             ; DOS service to display string
    int 21h               ; Call DOS interrupt

done:
    ; Exit program
    mov ah, 4Ch           ; DOS service to terminate program
    int 21h               ; Call DOS interrupt

main endp
end main





