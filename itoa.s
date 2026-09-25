.intel_syntax noprefix
.global itoa_digit

itoa_digit:
xor rax, rax
mov al, dil
add al, 0x30
ret