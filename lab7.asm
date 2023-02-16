#Jashan Rai
#lab7.asm

.intel_syntax noprefix
.data

OpeningMessage:
	.ascii "How much, in knuts, was the bill?\n\0"
HowManyMessage:
	.ascii "\nHow many people are splitting the bill?\n\0"
EndingMessage1:
	.ascii "\nOkay, witches and wizards, give \0"
EndingMessage2:
	.ascii " knuts each.\0"
RemainderMessage1:
	.ascii " However, there is a remainder of \0"
RemainderMessage2:
	.ascii " knuts, fight amongst yourselves on how to split it.\0"
TotalCost:
	.quad 0
AmountofPeople:
	.quad 0
CostPerPerson:
	.quad 0
Remainder:
	.quad 0

.text
.global _start

_start:
	lea rdx, OpeningMessage
	call PrintZString
	call ScanInt
	mov TotalCost, rdx

InputTesting:
	lea rdx, HowManyMessage
	call PrintZString
	call ScanInt
	cmp rdx,0
	jle InputTesting
	
Division:
	mov AmountofPeople, rdx
	mov rax, TotalCost
	CQO
	IDIVq AmountofPeople
	mov CostPerPerson, rax
	mov Remainder, rdx
	
WithoutRemainder:
	lea rdx, EndingMessage1
	call PrintZString
	mov rdx, CostPerPerson
	call PrintInt
	lea rdx, EndingMessage2
	call PrintZString
	mov rdx, Remainder
	cmp rdx, 0
	je Ending

WithRemainder:	
	lea rdx, RemainderMessage1
	call PrintZString
	mov rdx, Remainder
	call PrintInt
	lea rdx, RemainderMessage2
	call PrintZString

Ending:
	call Exit
