[BITS 64]

; Import + Export
    GLOBAL isPrime

section .data

NULL                EQU 0

section .text

 ; extern char isPrime(uint64_t n)
isPrime:
	cmp rdi, 1
	jle .notPrime
	
	mov rcx, 2
	.next:
		cmp rcx, rdi
		jnl .prime
		
		xor rdx, rdx ; must be zero for division
		mov rax, rdi
		div rcx
		
		cmp rdx, 0
		je .notPrime
		
		inc rcx
		jmp .next
	
	.prime:
	mov rax, 1
	ret
	
	.notPrime:
	xor rax, rax
	ret