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
	and rcx, 23
	jz .npc
	mov rax, 1
	ret
	
	.npc:
	xor rax, rax
	ret
hasHwAES:
	mov rax, 1
	cpuid
	and rcx, 25
	jz .naes
	mov rax, 1
	ret
	
	.naes:
	xor rax, rax
	ret
