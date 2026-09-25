.intel_syntax noprefix
.global itoa_digit
.global itoa

itoa_digit:
xor rax, rax
mov al, dil
add al, 0x30
ret

itoa:
xor rdx, rdx
mov rax, rdi
div 10
mov rdi, rax
call itoa_digit
mov [rsi], al
mov rdi, rdx
call itoa_digit
mov [rsi+1], al
mov rax, 2
ret