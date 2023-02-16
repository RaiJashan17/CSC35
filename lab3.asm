# lab3.asm
# Jashan Rai
.intel_syntax noprefix
.data

Sandwich:
	.ascii "1. Toasted Harry Supreme Sandwich (Meat: Harry Potter) (2000 knuts)\n\0"
Stew:
	.ascii "2. Voldemort's Suprise Stew (Meat: Mystery??) (100 kunts)\n\0"
Pizza:
	.ascii "3. Fresh Hogwarts Pizza (Sauce: Student's Blood, Toppings: Professor's Hairs) (1000 knuts)\n\0"
Cancel:
	.ascii "4. Cancel order: Do you not want to support Hogwart's downfall (0 knuts)\n\0"
Selection:
	.ascii "Please enter your selection:\n\0"
YouSelection:
	.ascii "You have selected:\n\0"
MoneyPrompt:
	.ascii "How many knuts are you feeding for my master plan?\n\0"
Change:
	.ascii " knuts is your change that I will keep for you. \n\0"
Names:
	.quad Sandwich
	.quad Stew
	.quad Pizza
	.quad Cancel

Cost:
	.quad 2000
	.quad 100
	.quad 1000
	.quad 0

.text
.global _start
_start:
	#Part 1
	mov rsi, 0
	mov rdx, [Names + rsi * 8]
	call PrintZString
	mov rsi, 1		
	mov rdx, [Names + rsi * 8]
	call PrintZString
	mov rsi, 2
	mov rdx, [Names + rsi * 8]
	call PrintZString
	mov rsi, 3
	mov rdx, [Names + rsi * 8]
	call PrintZString
	#Part 2
	lea rdx, Selection
	call PrintZString
	call ScanInt
	sub rdx, 1
	mov rsi, rdx
	lea rdx, YouSelection
	call PrintZString
	mov rdx, [Names + rsi * 8]
	call PrintZString
	#Part 3
	lea rdx, MoneyPrompt
	call PrintZString
	call ScanInt
	#Part 4
	sub rdx, [Cost + rsi * 8]
	call PrintInt
	lea rdx, Change
	call PrintZString
	
#Ends the program
	call Exit
	
