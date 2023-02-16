#lab4.asm
#Jashan Rai

.intel_syntax noprefix
.data

Prompt1:
	.ascii "Sorting House Stress Questionaire\n\0"
Prompt2:
	.ascii "\nDid you eat enough in the train ride? (Yes=1,No=0)\n\0"
Prompt3:
	.ascii "\nAre the ghosts of Hogwarts scaring you and insulting you? (Yes=1,No=0)\n\0"
Prompt4:
	.ascii "\nAre you afraid that Headmaster Voldemort is a poor Headmaster? (Yes=1,No=0)\n\0"
Prompt4Response:
	.ascii "I recommend changing your attitude toward Headmaster Voldemort while your here, he does not approve being insulted.\n\0"
Prompt5:
	.ascii "\nAre the other students mocking you for any reason? (Yes=1,No=0)\n\0"
Prompt6:
	.ascii "\nAre you excited to help Voldemort take over the Ministry of Magic? (Yes=1,No=0)\n\0"
Prompt6Response:
	.ascii "You should watch your mouth in here, Voldemort is listening at all times.\n\0"
Prompt7:
	.ascii "\nYour total stress level is: \0"

Prompt8:
	.ascii "\n\nOh dear! You are so stressed! Here! Have some magical calming hot cocoa and remember, Voldemort is watching! \n\0"
Prompt9:
	.ascii "\n\nYou are going to do fine student! Keep your chin up and remember Voldemort is supreme! \n\0"

.text
.global _start
_start:
	lea rdx, Prompt1
	call PrintZString
	lea rdx, Prompt2
	call PrintZString
	call ScanInt
	cmp rdx, 1
	je Question2

Question1:
	add rsi, 10

Question2:
	lea rdx, Prompt3
	call PrintZString
	call ScanInt
	cmp rdx, 0
	je Question3
	add rsi, 20

Question3:
	lea rdx, Prompt4
	call PrintZString
	call ScanInt
	cmp rdx, 0
	je Question4
	add rsi, 40
	lea rdx, Prompt4Response
	call PrintZString
	
Question4:
	lea rdx, Prompt5
	call PrintZString
	call ScanInt
	cmp rdx, 0
	je Question5
	add rsi, 30

Question5:
	lea rdx, Prompt6
	call PrintZString
	call ScanInt
	cmp rdx, 1
	je RunningTotal
	add rsi, 30
	lea rdx, Prompt6Response
	call PrintZString

RunningTotal:
	lea rdx, Prompt7
	call PrintZString
	mov rdx, rsi
	call PrintInt
	cmp rdx, 65
	jge Chocolate
	jl Encouragement

Chocolate:
	lea rdx, Prompt8
	call PrintZString
	jmp End

Encouragement:
	lea rdx, Prompt9
	call PrintZString
	jmp End

End:
	call Exit
