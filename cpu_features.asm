[BITS 64]

; Import + Export
    GLOBAL hasPopCnt
    GLOBAL hasHwAES

section .data

NULL                EQU 0

section .text

hasPopCnt:
	mov rax, 1
	cpuid
	and rcx, 0b100000000000000000000000
	jz .npc
	mov rax, 1
	ret
	
	.npc:
	xor rax, rax
	ret
hasHwAES:
	mov rax, 1
	cpuid
	and rcx, 0b10000000000000000000000000
	jz .naes
	mov rax, 1
	ret
	
	.naes:
	xor rax, rax
	ret
