.intel_syntax noprefix
.global itoa_digit
.global itoa

itoa_digit:
xor rax, rax
mov al, dil
add al, 0x30
ret

neg:
mov byte ptr [rsi], 0x2d
add rsi, 1
neg rdi
jmp compare

itoa:
mov r11, 0

compare:
cmp rdi, 0
je special
jl neg

mov r8, 0
mov r9, 0
mov rax, rdi

divide:
cmp rax, 0
je stitch

xor rdx, rdx
mov rcx, 10
div rcx
mov r10, rax
mov rdi, rdx
call itoa_digit
push rax
mov rax, r10
inc r8
jmp divide

stitch:
mov r11, r8

loop:
cmp r8, 0
je check
pop rax
mov [rsi+r9], al
sub r8, 1
inc r9
jmp loop

special:
mov byte ptr [rsi], 0x30
mov r11, 1
jmp check

check:
cmp byte ptr [rsi-1], 0x2d
jne done
inc r11
sub rsi, 1

done:
mov rax, r11
ret