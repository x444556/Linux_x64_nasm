[BITS 64]

; Import + Export
    GLOBAL parity_lookup
    GLOBAL parity_hw
    GLOBAL parity_flag
    GLOBAL parity_loop

section .data

partab: db 0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0

section .text

parity_lookup: ; this needs partab
	mov ecx, edi
	shr rdi, 32
	xor ecx, edi
	
	mov eax, ecx
	shr ecx, 16
	xor cx, ax
	
	xor cl, ch
	
	and rcx, 0xFF
	mov al, [partab + rcx]
	
	ret
parity_hw:
	popcnt rax, rdi
	and rax, 1
	
	ret
parity_flag:
	mov ecx, edi
	shr rdi, 32
	xor ecx, edi
	
	mov eax, ecx
	shr ecx, 16
	xor cx, ax
	
	xor cl, ch
	
	lahf
	not ah
	and ah, 0x04
	shr eax, 10
	
	ret
parity_loop:
	xor rcx, rcx
	xor rax, rax
	.next:
		mov rsi, rdi
		and rsi, 1
		cmp rsi, 0
		je .ns
		inc rax
		.ns:
		
		shr rdi, 1
		inc rcx
		cmp rcx, 64
		jne .next
	and rax, 1
	ret
