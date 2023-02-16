#Rai, Jashan
#WizardBattle.asm
#Version 1.0

.intel_syntax noprefix
.data

Welcome:
	.ascii "Welcome to Voldemort's Wizard Battle where you decide your fates! Promgrammed by Jashan Rai, head of programming at Hogwarts!\n\0"
PlayersQuestion:
	.ascii "How many student's will take on the challenge (Be prepared to be paralyzed)?\n\0"
Players:
	.quad Player1
	.quad Player2
	.quad Player3
	.quad Player4
	.quad Player5
	.quad Player6
	.quad Player7
	.quad Player8
	.quad Player9
	.quad Player10
PlayersNames:
	.quad Player1Name
	.quad Player2Name
	.quad Player3Name
	.quad Player4Name
	.quad Player5Name
	.quad Player6Name
	.quad Player7Name
	.quad Player8Name
	.quad Player9Name
	.quad Player10Name
Player1:
	.ascii "Player 1 \0"
Player2:
	.ascii "Player 2 \0"
Player3:
	.ascii "Player 3 \0"
Player4:
	.ascii "Player 4 \0"
Player5:
	.ascii "Player 5 \0"
Player6:
	.ascii "Player 6 \0"
Player7:
	.ascii "Player 7 \0"
Player8:
	.ascii "Player 8 \0"
Player9:
	.ascii "Player 9 \0"
Player10:
	.ascii "Player 10 \0"
Player1Name: 
	.ascii "Christopher Janson\0"
Player2Name:
	.ascii "Lark Hamnet\0"
Player3Name:
	.ascii "Marinda Rayner\0"
Player4Name:
	.ascii "Phillipa Defroest\0"
Player5Name:
	.ascii "Kirk Elyzabeth\0"
Player6Name:
	.ascii "Garnett Kaley\0"
Player7Name:
	.ascii "Brielle Trudy\0"
Player8Name:
	.ascii "Rosy Lex\0"
Player9Name:
	.ascii "Anselm Fanny\0"
Player10Name:
	.ascii "Hope Eryn\0"
PlayerColors:
	.quad 1
	.quad 3
	.quad 4
	.quad 2
	.quad 1
	.quad 2
	.quad 3
	.quad 4
	.quad 3
AmountofPlayers:
	.quad 0
PlayersHealth:
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
	.quad 0
TargetPrompt:
	.ascii "\nYour target: \0"
SpellPrompt:
	.ascii "The spell blasts/heals them for \0"
SpellPrompt2:
	.ascii " points\n\0"
HealthPrompt:
	.ascii "\nHealth : \0"
VictoryPrompt: 
	.ascii " is the winner, now Voldemort shall kill you since you are a threat to his motives!\n\0"
SpellNames1:
	.ascii "1. Alarte Ascendare  (10-20 damage, 90% chance of working)\n\0"
SpellNames2:	
	.ascii "2. Confringo         (75-100 damage, 10% chance of working)\n\0"
SpellNames3:	
	.ascii "3. Reparifors        (10-20 heal, 50% chance of working)\n\0"
SpellNameQuestion:
	.ascii "Which spell do you want on the other player? (Type in 1,2,3)\n\0"
FailSpell:
	.ascii "Patheic your spell failed and does nothing.\n\0"
BroomstickArt:
	.ascii "            _            _.,----,\n"
	.ascii " __  _.-._ / '-.        -  ,._  \)\n"
	.ascii "|  `-)_   '-.   \       / < _ )/\"\ }\n"
	.ascii "/__    '-.   \   '-, ___(c-(6)=(6)\n"
	.ascii " , `'.    `._ '.  _,'   >\    \"\  )\n"
	.ascii " :;;,,'-._   '---' (  ( \"\/`. -='/\n"
	.ascii ";:;;:;;,  '..__    ,`-.`)'- '--'\n"
	.ascii ";';:;;;;;'-._ /'._|   Y/   _/' \ \n"
	.ascii "      '''\"\._ F    |  _/ _.'._   `\ \n"
	.ascii "             L    \   \/     '._  \ \n"
	.ascii "      .-,-,_ |     `.  `'---,  \_ _|\n"
	.ascii "      //    'L    /  \,   (\"\--',=`)7\n"
	.ascii "     | `._       : _,  \  /'`-._L,_'-._\n"
	.ascii "     '--' '-.\__/ _L   .`'         './/\n"
	.ascii "                 [ (  /\n"
	.ascii "                  ) `{\n"
	.ascii "                  \__)\n\0"
Explosion:
	.ascii "     _.-^^---....,,--       \n"
	.ascii " _--                  --_  \n"
	.ascii "<                        >)\n"
	.ascii "|                         | \n"
	.ascii " \._                   _./  \n"
	.ascii "    ```--. . , ; .--'''      \n"
	.ascii "          | |   |             \n"
	.ascii "       .-=||  | |=-.   \n"
	.ascii "       `-=#$%&%$#=-'   \n"
	.ascii "          | ;  :|     \n"
	.ascii " _____.,-#%&$@%#&#~,._____\n\0"
Award:
	.ascii "     _______________\n"
	.ascii "    |@@@@|     |####|\n"
	.ascii "    |@@@@|     |####|\n"
	.ascii "    |@@@@|     |####|\n"
	.ascii "    \\\@@@@|     |####/ \n"
	.ascii "     \\\@@@|     |###/ \n"
	.ascii "      `@@|_____|##' \n"
	.ascii "           (O) \n"
	.ascii "        .-'''''-. \n"
	.ascii "      .'  * * *  `. \n"
	.ascii "     :  *       *  : \n"
	.ascii "    : ~ D E A T H ~ : \n"
	.ascii "    : ~ A W A R D ~ : \n"
	.ascii "     :  *       *  : \n"
	.ascii "      `.  * * *  .' \n"
	.ascii "        `-.....-' \n\0"

.text
.global _start
_start:
	lea rdx, Welcome          #Prompts user of program's function
	call PrintZString
	lea rdx, BroomstickArt
	call PrintZString
	lea rdx, PlayersQuestion #Asks user for how many players are being used (Max:10)
	call PrintZString
	mov rsi, 0
	mov rdx, 4
	call SetForeColor
	call ScanInt             #Asks user for amount of players
	mov AmountofPlayers, rdx
	mov rdx, 7
	call SetForeColor

AddingHealth:
	mov rdx, [PlayersHealth + rsi * 8] #Depending on amount of users, gives all of them 100
	add rdx, 100
	mov [PlayersHealth + rsi * 8], rdx
	add rsi, 1
	cmp AmountofPlayers, rsi
	jg AddingHealth                    #Continues Until all the players playing have 100

	mov rsi, 0                     #Initializes register for later use
	mov rdi, 0
	mov r8, 0
	mov r9, AmountofPlayers  
	sub r9, 1                      #Subtract 1 to show that this is many dead needed to end the game

Action:
	mov rcx, [PlayersHealth+rsi*8]  #Checks if player is dead and skips if they are 
	cmp rcx,0
	jle Death
	mov rdx, [PlayerColors+rsi*8]   #Tells which player is playing
	call SetForeColor
	mov rdx, [Players + rsi * 8]
	call PrintZString
	mov rdx, [PlayersNames + rsi * 8] 
	call PrintZString
	mov rdx, 7
	call SetForeColor
	lea rdx, HealthPrompt           #Tells current health of player
	call PrintZString
	mov rdx, 1
	call SetForeColor
	mov rdx, [PlayersHealth + rsi * 8]
	call PrintInt
	mov rdx, 7
	call SetForeColor
	lea rdx, TargetPrompt           #Asks who they want to target for this round
	call PrintZString
	mov rdx, 4
	call SetForeColor
	call ScanInt
	mov rax, rdx
	mov rdx, 7
	call SetForeColor
	sub rax, 1

WhichSpell:
	lea rdx, SpellNameQuestion
	call PrintZString
	lea rdx,SpellNames1
	call PrintZString
	lea rdx, SpellNames2
	call PrintZString
	lea rdx, SpellNames3
	call PrintZString
	mov rdx, 4
	call SetForeColor
	call ScanInt                 #Asks which spell that the user wants to attack with
	cmp rdx, 1
	je Spell1
	cmp rdx, 2
	je Spell2
	cmp rdx, 3
	je Spell3
	jmp Spell4

Spell1:
	mov rdx, 7
	call SetForeColor
	mov rdx, 10
	call Random                  #Checks if the attack did indeed work, otherwise skips
	add rdx, 1
	mov rbx, rdx
 	cmp rbx, 9
	jg Spell4
	mov rdx, 10
	call Random                  #If the attack works, subtracts 10-20 health and moves to next player
	add rdx, 10
	mov rbx, [PlayersHealth+rax*8]
	sub rbx, rdx
	mov [PlayersHealth + rax * 8], rbx
	mov r11, rdx
	lea rdx, SpellPrompt
	call PrintZString
	mov rdx, 1
	call SetForeColor
	mov rdx, r11
	call PrintInt
	mov rdx, 7
	call SetForeColor
	lea rdx, SpellPrompt2
	call PrintZString
	jmp NextPlayer

Spell2:
	mov rdx, 7
	call SetForeColor
	mov rdx, 10
	call Random                   #Checks if the attack did indeed work, otherwise skips
	add rdx, 1
	mov rbx, rdx
	cmp rbx, 1
	jg Spell4
	mov rdx, 25
	call Random                   #If the attack works, subtracts 75-100 health and moves to next player
	add rdx, 75
	mov rbx, [PlayersHealth+rax*8]
	sub rbx, rdx
	mov [PlayersHealth+rax*8], rbx
	mov r11,rdx
	lea rdx, Explosion
	call PrintZString
	lea rdx, SpellPrompt
	call PrintZString
	mov rdx, 1
	call SetForeColor
	mov rdx, r11
	call PrintInt
	mov rdx, 7
	call SetForeColor
	lea rdx, SpellPrompt2
	call PrintZString
	jmp NextPlayer

Spell3:
	mov rdx, 7
	call SetForeColor
	mov rdx, 10
	call Random                    #Checks if the health did indeed work, otherwise skips
	add rdx, 1
	mov rbx, rdx
	cmp rbx, 5
	jg Spell4
	mov rdx, 10
	call Random                    #If the heals works, add 10-20 health and moves to next player
	add rdx, 10                    #Note:Not intended, but can restruct players, which is why 50/50 chance of working is added to stop restruction spam
	mov rbx, [PlayersHealth+rax*8]
	add rbx, rdx
	mov [PlayersHealth+rax*8], rbx
	mov r11, rdx
	lea rdx, SpellPrompt
	call PrintZString
	mov rdx, 3
	call SetForeColor
	mov rdx, r11
	call PrintInt
	mov rdx, 7
	call SetForeColor
	lea rdx, SpellPrompt2
	call PrintZString
	jmp NextPlayer

Spell4:
	mov rdx, 7        #If the spell failed, let's the user know and moves to next player
	call SetForeColor
	lea rdx, FailSpell
	call PrintZString
	jmp NextPlayer

	

Death:
	add rdi, 1               #If player is dead, adds a player to the grave register(Resets every loop, to avoid issues)

NextPlayer:	
	add rsi, 1               #Checks if all the players have got a turn
	cmp rsi, AmountofPlayers
	jl Action                #If all players have not got a turn, moves back for other players


ActionLoop:
	cmp rdi, r9     #Checks if enough are dead to declare winner
	jge VictoryLoop #Note: Since this is checked at the end, player may have to play extra turn to make sure other player is dead before Voldemort calls them winner
	mov rsi, 0      #Resets the index so it can start from player 1
	mov rdi, 0
	jmp Action

VictoryLoop:
	mov rdx, [PlayersHealth+r8*8] #Checks which person is still living
	cmp rdx, 0
	jg Victory                    #If the player has more than 0 health, declares them winner, otherwise, keeps searching for them
	add r8, 1
	jmp VictoryLoop

Victory:
	lea rdx, Award
	call PrintZString
	mov rdx, [PlayerColors+r8*8] #Prints out the winner of this brawl
	call SetForeColor
	mov rdx, [Players+r8*8]
	call PrintZString
	mov rdx, [PlayersNames+r8*8] #And show them their prize...
	call PrintZString
	mov rdx, 3
	call SetForeColor
	lea rdx, VictoryPrompt
	call PrintZString
	
End:
	call Exit 
