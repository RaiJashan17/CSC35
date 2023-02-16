#lab6.asm
#Jashan Rai

.intel_syntax noprefix
.data

OpeningMessage:
	.ascii "Greeting Ravenclaw Students!\nBefore you may proceed... within 1 and 100, a number I need.\n\0"
GuessMessage:
	.ascii "\nGuess: \0"
LargeMessage:
	.ascii "Alas, that is too large.\n\0"
SmallMessage:
	.ascii "Regrettably, that is too small.\n\0"
CorrectMessage:
	.ascii "\nWell-reasoned! You may now enter!\n\0"
RandomNumber:
	.quad 0

.text
.global _start

_start:
	lea rdx, OpeningMessage
	call PrintZString
	mov rdx, 100
	call Random
	add rdx, 1
	mov RandomNumber, rdx
	
Loop:
	lea rdx, GuessMessage
	call PrintZString
	call ScanInt
	cmp rdx, RandomNumber
	jg Large
	jl Small
	je End

Small:
	lea rdx, SmallMessage
	call PrintZString
	jmp Loop

Large: 
	lea rdx, LargeMessage
	call PrintZString
	jmp Loop

End:
	lea rdx, CorrectMessage
	call PrintZString
	call Exit 
