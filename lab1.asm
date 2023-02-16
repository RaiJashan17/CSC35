#lab1.asm 
#Jashan Rai
#
#1. Assemble: as -o lab1.o lab1.asm
#2. Link    : ld -o a.out lab1.o csc35.o
#3. Execute : ./a.out

.intel_syntax noprefix #Uses Intel formatting
.data #Starts the data section part of the program
Greeting:   #Message is an address
	.ascii "Hello, world!\n\0" #Create a buffer of ASCII
Name: #Message is an address
	.ascii "My name is Jashan Rai!\n\0" #Create a buffer of ASCII
Quote: #message is an address
	.ascii "'I've never been cool and I don't really care about being cool. It's just an awful lot of time and hair gel wasted.' -Chris Martin, Coldplay\n\0" #Create a buffer of ASCII
Year: #Message is an address
	.ascii "The NFL was founded in 1920, making it the 122nd year in existence.\n\0" #Create a buffer of ASCII

.text #Start the text section
.global _start #Make the _start label public

_start: #UNIX starts here
	lea rdx, Greeting #Put address into rdx
	call PrintZString  #Execute the csc35.o subroutine
	lea rdx, Name #Put address into rdx
	call PrintZString #Execute the csc35.o subrountine
	lea rdx, Quote
	call PrintZString 
	lea rdx, Year
	call PrintZString

	call Exit #Execute the csc35.o subroutine
