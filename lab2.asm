.intel_syntax noprefix
.data
name:
	.byte 'J'
	.byte 'A'
	.byte 'S'
	.byte 'H'
	.byte 'A'
	.byte 'N'
	.byte ' '
	.byte 'R'
	.byte 'A'
	.byte 'I'
	.byte '\n'
	.byte '\n'
	.byte 0
fundsPrompt:
	.ascii "Please enter how much you earn each month:\n\0"
funds:
	.quad 0
expensePrompt:
	.ascii "\nPlease enter an expense that you have each month (Examples: Food, Housing, etc):\n\0"
expenseOne:
	.quad 0
expenseTwo:
	.quad 0
expenseTotalPrompt:
	.ascii "\nTotal expenses incurred per month is: $\0"
expenseTotal:
	.quad 0
cashFlowPrompt:
	.ascii "\n\nYour total cash flow is: $\0"
cashFlow:
	.quad 0
.text
.global _start
_start:
	lea rdx,name
	call PrintZString

	lea rdx,fundsPrompt
	call PrintZString 
	call ScanInt
	add funds,rdx
	mov rdx, funds

	lea rdx, expensePrompt
	call PrintZString
	call ScanInt
	add expenseOne, rdx
	mov rdx, expenseOne

	lea rdx, expensePrompt
	call PrintZString
	call ScanInt
	add expenseTwo, rdx 
	mov rdx, expenseTwo

	mov rdx, expenseOne
	add rdx, expenseTwo
	mov expenseTotal, rdx
	lea rdx, expenseTotalPrompt
	call PrintZString
	mov rdx, expenseTotal
	call PrintInt

	mov rdx, funds
	sub rdx, expenseTotal
	mov cashFlow, rdx
	lea rdx, cashFlowPrompt
	call PrintZString
	mov rdx, cashFlow
	call PrintInt

	call Exit
