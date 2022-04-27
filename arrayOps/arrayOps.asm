[BITS 64]

; Import + Export
    GLOBAL clearVec
    GLOBAL fillVec
    GLOBAL copyVec
    GLOBAL compare
    GLOBAL compare_zero

section .data

NULL                EQU 0

section .text

clearVec:
    push rbp
    mov rbp, rsp

    xor rcx, rcx
    .next:
        mov rax, rdi
        add rax, rcx
        mov [rax], byte 0

        inc rcx
        cmp rcx, rsi
        jne .next
    
    xor rax, rax    ; rax = 0
    mov rsp, rbp ; restore stack pointer + free local variables
    pop rbp
    ret
fillVec:
    push rbp
    mov rbp, rsp

    xor rcx, rcx
    .next:
        mov rax, rdi
        add rax, rcx
        mov [rax], dl

        inc rcx
        cmp rcx, rsi
        jne .next
    
    xor rax, rax    ; rax = 0
    mov rsp, rbp ; restore stack pointer + free local variables
    pop rbp
    ret
compare:
    push rbp
    mov rbp, rsp

    xor rcx, rcx
    xor R9, R9
    .next:
        mov AL, BYTE [rdi + rcx]
        cmp AL, BYTE [rsi + rcx]
        je .equal

        inc R9
        .equal:

        inc rcx
        cmp rcx, rdx
        jne .next

    mov rax, R9 ; return value
    mov rsp, rbp ; restore stack pointer + free local variables
    pop rbp
    ret
compare_zero:
    push rbp
    mov rbp, rsp

    xor rcx, rcx
    xor R9, R9
    .next:
        cmp BYTE [rdi + rcx], BYTE 0
        je .equal

        inc R9
        .equal:

        inc rcx
        cmp rcx, rsi
        jne .next

    mov rax, R9 ; return value
    mov rsp, rbp ; restore stack pointer + free local variables
    pop rbp
    ret
copyVec:
    push rbp
    mov rbp, rsp

    xor rcx, rcx
    .next:
        mov AL, BYTE [rdi + rcx]
        mov BYTE [rsi + rcx], AL

        inc rcx
        cmp rcx, rdx
        jne .next

    xor rax, rax
    mov rsp, rbp ; restore stack pointer + free local variables
    pop rbp
    ret