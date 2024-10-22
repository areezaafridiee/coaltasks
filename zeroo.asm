
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
    msg1 DB 10,13, "Enter a one-digit number (0-9):$", 0  ; Prompt message
    msg_positive DB 10,13, "The number is positive.$", 0  ; Message if number is positive
    msg_zero DB 10,13, "The number is zero.$", 0          ; Message if number is zero
    msg_invalid DB 10,13, "Invalid input. Please enter a number between 0 and 9.$", 0

.code
main proc
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Display msg1: "Enter a one-digit number (0-9):"
    mov dx, offset msg1
    mov ah, 9             ; DOS service to display string
    int 21h

    ; Input a single-digit number from the user
    mov ah, 1             ; DOS service to read a character from keyboard
    int 21h

    ; Convert ASCII to numeric value
    sub al, '0'           ; Convert from ASCII ('0'-'9') to number (0-9)

    ; Check if the input is within the valid range (0-9)
    cmp al, 0
    jl invalid_input       ; If less than 0, jump to invalid_input
    cmp al, 9
    jg invalid_input       ; If greater than 9, jump to invalid_input

    ; Determine if the number is zero or positive
    cmp al, 0              ; Compare the number with 0
    je is_zero             ; If equal to zero, jump to 'is_zero'

    ; If number is positive, display "The number is positive."
    mov dx, offset msg_positive
    mov ah, 9              ; DOS service to display string
    int 21h
    jmp done               ; Jump to done

is_zero:
    ; If the number is zero, display "The number is zero."
    mov dx, offset msg_zero
    mov ah, 9              ; DOS service to display string
    int 21h
    jmp done               ; Jump to done

invalid_input:
    ; Display invalid input message if the entered number is not in the range (0-9)
    mov dx, offset msg_invalid
    mov ah, 9              ; DOS service to display string
    int 21h

done:
    ; Exit the program
    mov ah, 4Ch            ; DOS service to terminate program
    int 21h

main endp
end main


ret




