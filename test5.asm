section .data
	int_format db "%ld",10,0


	global _main
	extern _printf
section .text


_start:	call _main
	mov rax, 60
	xor rdi, rdi
	syscall


_main:	push rbp
	mov rbp, rsp
	sub rsp, 96
	mov esi, 3
	mov [rbp-24], esi
	mov esi, 0
	mov [rbp-32], esi
	mov edi, [rbp-32]
	mov eax, [rbp-24]
	cmp eax, edi
	mov [rbp-24], eax
	jz lab1259
	jmp lab1261
lab1259:	mov esi, 4
	mov [rbp-16], esi
	mov rax, [rbp-16]
	jmp finish_up
lab1261:	mov esi, 0
	mov [rbp-8], esi
	mov rax, [rbp-8]
	jmp finish_up
finish_up:	add rsp, 96
	leave 
	ret 

