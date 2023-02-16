#lab5.asm
#Jashan Rai, Section 5

.intel_syntax noprefix
.data

Prompt1: 
	.ascii "Welcome to Hogwarts! \nThe Voldemort's Sorting Hat (Version: 1.0) is being placed upon your head.\n\0"
Prompt2:
	.ascii "Will you plan on helping Voldemort directly or indirectly? (Yes=y,No=n)\n\0"
Prompt3:
	.ascii "Are you a good speaker or a good researcher? (Speaker=y, Researcher=n)\n\0"
Prompt4:
	.ascii "Do you listen to Voldemort's commands or make your own? (Listen=y, Don't Listen=n)\n\0"
Ravenclaw:
	.ascii "You shall be Ravenclaw, where you will help Voldemort research how to take over the Ministry of Magic once and for all! Join your table and start reading!\n\0"
Hufflepuff:
	.ascii "You shall be Hufflepuff, where you will help Voldemort gain contacts inside the Ministry of Magic, and regain lost allies! Join your table and make allies for the assult!\n\0"
Gryffindor:
	.ascii "You shall be Gryffindor, where you prepare for the second half of the assualt, and hand over Heromine Granger to me! Join your table and bow to the Supreme Ruler, Voldemort!\n\0"
Slytherin:
	.ascii "You shall be Slytherin, where you prepare for the first half of the assualt, cleverly taking out anyone you want! Join your table, glory awaits!\n\0"

.text
.global _start
_start:
	lea rdx, Prompt1
	call PrintZString
	lea rdx, Prompt2
	call PrintZString
	call ScanChar
	cmp dl, 121
	je Question3
	jmp Question2

Question2:
	lea rdx, Prompt3
	call PrintZString
	call ScanChar
	cmp dl, 121
	je HufflepuffMessage
	lea rdx, Ravenclaw
	call PrintZString
	jmp End

Question3:
	lea rdx, Prompt4
	call PrintZString
	call ScanChar
	cmp dl, 121
	je GryffindorMessage
	lea rdx, Slytherin
	call PrintZString
	jmp End

HufflepuffMessage:
	lea rdx, Hufflepuff
	call PrintZString
	call End

GryffindorMessage:
	lea rdx, Gryffindor
	call PrintZString
	call End

End:
	call Exit
