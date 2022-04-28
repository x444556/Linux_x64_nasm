[BITS 64]

; Import + Export
    GLOBAL ToBinStr

section .data

NULL                EQU 0

section .text

 ; extern void ToBinStr(char* buffer, uint64_t n)
ToBinStr:
	; rdi = char* buffer
	; rsi = uint64_t n
	xor rcx, rcx
	.next:
		mov rax, rsi
		shl rax, cl
		shr rax, 63
		add AL, '0'
		mov BYTE [rdi + rcx], AL
		
		inc rcx
		cmp rcx, 64
		jne .next
	mov BYTE [rdi + 64], 0
	
	xor rax, rax
	ret