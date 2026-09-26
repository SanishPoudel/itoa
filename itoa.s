.intel_syntax noprefix
.global itoa_digit
.global itoa

itoa_digit:
xor rax, rax
mov al, dil
add al, 0x30
ret

itoa:
mov r8, 0
mov r9, 0
xor rdx, rdx
cmp rdi, 0
je special
mov rax, rdi
mov rcx, 10
div rcx
cmp rax, 0
je last

mov rdi, rax
call itoa_digit
mov [rsi+r9], al
inc r9
inc r8

last:
mov rdi, rdx
call itoa_digit
mov [rsi+r9], al
inc r8
mov rax, r8
ret

special:
call itoa_digit
mov [rsi], al
mov rax, 1
ret