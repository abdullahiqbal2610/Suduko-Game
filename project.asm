[org 0x0100]
jmp start


rows: db '0'
columns: db '0'
numberEntered: db '0'

ticks:        dw   0
seconds:      dw   0
minutes:      dw   0
oldisr:      dd   0

message1: db "Mistake Count: 0"
length1: dw 18

message2: db "Score:"
length2: dw 6

message3: db "Timer: "
length3: dw 7

message4: db "Instructions: "
length4: dw 13

message5: db "Notes: Purple "
length5: dw 14

message6: db "Numbers: Black"
length6: dw 14

firstLine: db"   ____    _    __  __ _____    _____     _______ ____  "
secondLine: db"  / ___|  / \  |  \/  | ____|  / _ \ \   / / ____|  _ \ "
thirdLine: db" | |  _  / _ \ | |\/| |  _|   | | | \ \ / /|  _| | |_) |"
fourthLine: db" | |_| |/ ___ \| |  | | |___  | |_| |\ V / | |___|  _ < "
fifthLine: db"  \____/_/   \_\_|  |_|_____|  \___/  \_/  |_____|_| \_\"



exitMessage: db "Thank you for playing!"

startScreenMessage1: db "Press '"
startScreenlength1: dw 7

startScreenMessage2: db "' for 'Easy'"  
startScreenlength2: dw 12

startScreenMessage4: db "' for 'Medium'"  
startScreenlength4: dw 14

startScreenMessage5: db "' for 'Hard'"  
startScreenlength5: dw 12

startScreenMessage3: db "' to Quit! "
startScreenlength3: dw 11



WinMessage: db "   You Won the Game!"

len: dw 20



WinfirstLine: db " _____                             _         _       _   _ "  

WinsecondLine: db "/ ____|                           | |       | |     | | (_)  "

WinthirdLine: db "| |     ___  _ __   __ _ _ __ __ _| |_ _   _| | __ _| |_ _  ___  _ __  ___ "

WinfourthLine: db "| |    / _ \| '_ \ / _` | '__/ _` | __| | | | |/ _` | __| |/ _ \| '_ \/ __|"

WinfifthLine: db "| |___| (_) | | | | (_| | | | (_| | |_| |_| | | (_| | |_| | (_) | | | \__ \"

WinsixthLine: db " \_____\___/|_| |_|\__, |_|  \__,_|\__|\__,_|_|\__,_|\__|_|\___/|_| |_|___/"

WinseventhLine: db "                    __/ |                                                "

WineighttLine: db "                   |___/                                                  "




;26 spaces (easy)
countforNumbers1: db 2, 4, 3, 1, 3, 4, 1, 4, 4

;38 spaces (medium)
countforNumbers2: db 4, 4, 4, 3, 5, 5, 4, 4, 5

;50 spaces (hard)
countforNumbers3: db 5, 6, 5, 5, 5, 6, 5, 6, 7



moveFlag: db '2'
WinFlag: db '2'

mistakeCount: db 0
Gamescore: db 0


eraseValue: db 0

;input of game
game1: db "Press 'g' to play"
game2: db "Press 'n' for notes"
game3: db "Press 'u' for erase"
game4: db "Enter rows:"
game5: db "Enter cols:"
game6: db "Enter Number:"
game7: db "Press z to erase notes"
game8: db "Press x to Exit"

PuzzleKey:    db 8, 2, 7, 1, 5, 4, 3, 9, 6
              db 9, 6, 5, 3, 2, 7, 1, 4, 8
              db 3, 4, 1, 6, 8, 9, 7, 5, 2
              db 5, 9, 3, 4, 6, 8, 2, 7, 1
              db 4, 7, 2, 5, 1, 3, 6, 8, 9
              db 6, 1, 8, 9, 7, 2, 4, 3, 5
              db 7, 8, 6, 2, 3, 5, 9, 1, 4
              db 1, 5, 4, 7, 9, 6, 8, 2, 3
              db 2, 3, 9, 8, 4, 1, 5, 6, 7

;easy
Puzzle1:      db 8, 0, 7, 1, 5, 0, 0, 9, 6
              db 0, 6, 5, 3, 0, 7, 1, 4, 0
              db 3, 4, 1, 0, 8, 0, 7, 0, 2
              db 5, 9, 3, 4, 6, 8, 2, 7, 0
              db 4, 0, 0, 0, 1, 0, 0, 0, 9
              db 0, 1, 8, 9, 7, 2, 4, 3, 5
              db 7, 0, 6, 0, 3, 0, 9, 1, 4
              db 0, 5, 4, 7, 0, 6, 8, 2, 0
              db 2, 3, 0, 0, 4, 1, 5, 0, 7

;medium
Puzzle2:      db 8, 0, 0, 1, 5, 0, 0, 9, 6
              db 0, 6, 0, 3, 0, 0, 1, 4, 0
              db 3, 0, 1, 0, 8, 0, 7, 0, 2
              db 0, 0, 3, 4, 0, 8, 2, 7, 0
              db 4, 0, 0, 0, 1, 0, 0, 0, 9
              db 0, 1, 8, 9, 0, 2, 4, 0, 5
              db 7, 0, 6, 0, 3, 0, 9, 0, 4
              db 0, 5, 0, 7, 0, 6, 8, 2, 0
              db 2, 3, 0, 0, 4, 0, 5, 0, 7  

;hard
Puzzle3:      db 0, 0, 0, 1, 5, 0, 0, 9, 0
              db 0, 6, 0, 3, 0, 0, 1, 0, 0
              db 3, 0, 0, 0, 8, 0, 7, 0, 0
              db 0, 0, 0, 4, 0, 0, 2, 7, 0
              db 4, 0, 0, 0, 1, 0, 0, 0, 9
              db 0, 1, 8, 0, 0, 2, 4, 0, 5
              db 7, 0, 6, 0, 3, 0, 0, 0, 0
              db 0, 5, 0, 0, 0, 6, 8, 2, 0
              db 0, 3, 0, 0, 4, 0, 5, 0, 7

boardLevel: db '0'
valueRetrieved: db 0


arrayForDi: dw 0,0,0,0,0,0,0,0,0,0
arrayForNum: db 0,0,0,0,0,0,0,0,0,0




;********************************************
Winclrscr:
        push ax
        push es
        push di
        mov ax, 0xb800
        mov es, ax
        mov di, 0

        Winnextloc: mov word [es:di], 0x3020 ; clear next char on screen 
        add di, 2 ; move to next screen location 
        cmp di, 4000 ; has the whole screen cleared 
        jne Winnextloc ; if no clear next position 
        pop di 
        pop ax 
        pop es 
        ret

printWinLine:
    push bp
    mov bp, sp
    push si
    push cx
    push di
    push ax
    push es

    mov ax, 0xb800
    mov es, ax  

    mov ah, 0xB6
    mov si, [bp + 8]
    mov cx, [bp + 6]
    mov di, [bp + 4]
    

WinnextLetter: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop WinnextLetter

    pop es
    pop ax
    pop di
    pop cx
    pop si
    pop bp
    ret 6

printWinText:
    push bp 
    mov bp, sp
    push es
    push di
    push ax
    push si
    push cx
    push dx
    push bx

    mov ax, 0xb800
    mov es, ax   

;1st line
    mov si, WinfirstLine ;msg
    push si
    mov cx, 59 ;len
    push cx
    mov di, 164 ;postion
    push di
    call printWinLine

;2nd line
    mov si, WinsecondLine ;msg
    push si
    mov cx, 60 ;len
    push cx
    mov di, 324 ;postion
    push di
    call printWinLine
;3rd line
    mov si, WinthirdLine ;msg
    push si
    mov cx, 75 ;len
    push cx
    mov di, 484 ;postion
    push di
    call printWinLine
;4th line
    mov si, WinfourthLine ;msg
    push si
    mov cx, 75 ;len
    push cx
    mov di, 644 ;postion
    push di
    call printWinLine
;5th line
    mov si, WinfifthLine ;msg
    push si
    mov cx, 76 ;len
    push cx
    mov di, 804 ;postion
    push di
    call printWinLine
;6th line
    mov si, WinsixthLine ;msg
    push si
    mov cx, 75 ;len
    push cx
    mov di, 964 ;postion
    push di
    call printWinLine
;7th line
    mov si, WinseventhLine ;msg
    push si
    mov cx, 74 ;len
    push cx
    mov di, 1124 ;postion
    push di
    call printWinLine
;8th line
    mov si, WineighttLine ;msg
    push si
    mov cx, 74 ;len
    push cx
    mov di, 1284;postion
    push di
    call printWinLine
    
    pop bx
    pop dx
    pop cx
    pop si
    pop ax
    pop di
    pop es
    pop bp
    ret 

printWinend:
    push bp 
    mov bp, sp
    push es
    push di
    push ax
    push si
    push cx
    push dx
    push bx

    mov ax, 0xb800
    mov es, ax     
    mov al, 80
    mul byte [bp+8]
    add ax, [bp+10]
    shl ax, 1
    xor di, di
    mov di, ax
    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, [bp + 12]

WinnextChar: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop WinnextChar

    
    pop bx
    pop dx
    pop cx
    pop si
    pop ax
    pop di
    pop es
    pop bp
    ret 8


printStartScreen: 
    push bp
    mov bp, sp
    push es
    push di
    push ax
    push si
    push cx
    push bx
    mov ax, 0xb800
    mov es, ax
    mov di, 1184
    mov ah, 0x30
    mov al, 201
    mov [es:di], ax
    add di, 2
    mov cx,13
    Startline1:
    mov al, 205
    mov [es:di], ax
    add di, 2
    loop Startline1
    mov al, 187
    mov [es:di], ax
    add di, 2

    mov di, 1344
    mov al, 186
    mov [es:di], ax
    add di, 2
    mov al, 255
    mov [es:di], ax
    add di, 2
    mov ah, 0x32
    mov al, 83
    mov [es:di], ax
    add di, 2
    mov al, 255
    mov [es:di], ax
    add di, 2
    mov ah, 0x34
    mov al, 85
    mov [es:di], ax
    add di, 2
    mov al, 255
    mov [es:di], ax
    add di, 2
    mov ah, 0x31
    mov al, 68
    mov [es:di], ax
    add di, 2
    mov al, 255
    mov [es:di], ax
    add di, 2
    mov ah, 0x34
    mov al, 85
    mov [es:di], ax
    add di, 2
    mov al, 255
    mov [es:di], ax
    add di, 2
    mov ah, 0x31
    mov al, 75
    mov [es:di], ax
    add di, 2
    mov al, 255
    mov [es:di], ax
    add di, 2
    mov ah, 0x32
    mov al, 79
    mov [es:di], ax
    add di, 2
    mov al, 255
    mov [es:di], ax
    add di, 2
    mov ah, 0x30
    mov al, 186
    mov [es:di], ax

    mov di, 1504
    mov ah, 0x30
    mov al, 200
    mov [es:di], ax
    add di, 2
    mov cx,13
    Startline2:
    mov al, 205
    mov [es:di], ax
    add di, 2
    loop Startline2
    mov al, 188
    mov [es:di], ax

    mov di,1820
    mov si, [bp+14]
    mov cx, [bp+12]
    mov ah, 0x30

    Startnextchar1: 
        mov al, [si]
        mov [es:di], ax
        add di, 2
        add si, 1
        loop Startnextchar1


        mov di, 1834
        mov al, 0x65
        mov ah, 0xB4
        mov [es:di], ax
        add di, 2
        

    mov si, [bp+10]
    mov cx, [bp+8]
    mov ah, 0x30

    Startnextchar2: 
        mov al, [si]
        mov [es:di], ax
        add di, 2
        add si, 1
        loop Startnextchar2

        mov si, startScreenMessage1
        mov cx, [startScreenlength1]
        
        mov di, 2140
        mov ah, 0x30
        StartNextChar3:
            mov al, [si]
            mov [es:di], ax
            add di, 2
            add si, 1
            loop StartNextChar3
        mov al, 0x6D
        mov ah, 0xB4
        mov [es:di], ax
        add di, 2

        mov si, startScreenMessage4
        mov cx, [startScreenlength4]
        
  
        mov ah, 0x30
        StartNextChar4:
            mov al, [si]
            mov [es:di], ax
            add di, 2
            add si, 1
            loop StartNextChar4

        mov di, 2460
        mov si, startScreenMessage1
        mov cx, [startScreenlength1]
        mov ah, 0x30
        StartNextChar5:
            mov al, [si]
            mov [es:di], ax
            add di, 2
            add si, 1
            loop StartNextChar5
        mov al, 0x68
        mov ah, 0xB4
        mov [es:di], ax
        add di, 2
        
        mov si, startScreenMessage5
        mov cx, [startScreenlength5]
        mov ah, 0x30
        StartNextChar6:
            mov al, [si]
            mov [es:di], ax
            add di, 2
            add si, 1
            loop StartNextChar6

        mov di, 2780
        mov si, startScreenMessage1
        mov cx, [startScreenlength1]
        mov ah, 0x30
        StartNextChar7:
            mov al, [si]
            mov [es:di], ax
            add di, 2
            add si, 1
            loop StartNextChar7
        mov al, 0x78
        mov ah, 0xB4
        mov [es:di], ax
        add di, 2 

        mov si, startScreenMessage3
        mov cx, [startScreenlength3]
        mov ah, 0x30    
        StartNextChar8:
            mov al, [si]
            mov [es:di], ax
            add di, 2
            add si, 1
            loop StartNextChar8
        

    pop bx
    pop cx
    pop si
    pop ax
    pop di
    pop es
    pop bp
    ret


 clrStartScreen:
        push ax
        push es
        push di
        mov ax, 0xb800
        mov es, ax
        mov di, 0

        Startnextloc: mov word [es:di], 0x30C4 ; clear next char on screen 
        add di, 2 ; move to next screen location 
        cmp di, 4000 ; has the whole screen cleared 
        jne Startnextloc ; if no clear next position 
         pop di 
        pop ax 
        pop es 
        ret



 clrscr:
        push ax
        push es
        push di
        mov ax, 0xb800
        mov es, ax
        mov di, 0

        nextloc: mov word [es:di], 0x3020
        add di, 2 
        cmp di, 20000
        jne nextloc 
        pop di 
        pop ax 
        pop es 
        ret




; subroutine to print a two digit number with leading zero
printnum:     push bp 
              mov  bp, sp 
              push es 
              push ax 
              push bx 
              push cx 
              push dx 
              push di 
            
              mov di, [bp + 6]        ; get display position
              mov  ax, [bp+4]         ; get number to print
              mov  bl, 10 
              div  bl                 ; divide by 10
              
              add  al, 0x30          ; convert tens place to ASCII
              add  ah, 0x30          ; convert ones place to ASCII
              
              mov  dl, al            ; first store tens digit
              mov  dh, 0x3C          ; normal attribute
              mov  [es:di], dx        
              add  di, 2             
              
              mov  dl, ah            ; then store ones digit
              mov  [es:di], dx       
              
              pop  di 
              pop  dx 
              pop  cx 
              pop  bx 
              pop  ax 
              pop  es 
              pop  bp 
              ret  4

; subroutine to print full timer display (MM:SS)
printtimer:   push es
              push ax
              push di
              
              mov  ax, 0xb800
              mov  es, ax            ; point es to video base
              mov  di, 626          ; position for display
              
              ; Print minutes
              push di
              push word [cs:minutes]
              call printnum
              
              ; Print colon
              add di, 4              ; move past the minutes digits
              mov  ax, 0x3C3A       ; ':' with attribute
              mov  [es:di], ax
              add  di, 2
              
              ; Print seconds
              push di
              push word [cs:seconds]
              call printnum
              
              pop  di
              pop  ax
              pop  es
              ret

; timer interrupt service routine 
timer:        push ax
              push bx
              push cx
              push dx
              
              inc  word [cs:ticks]        ; increment tick counter
              mov  ax, [cs:ticks]
              cmp  ax, 18                 ; check if one second passed (18.2 ticks/second)
              jne  skipall
              
              mov  word [cs:ticks], 0     ; reset tick counter
              
              inc  word [cs:seconds]      ; increment seconds
              cmp  word [cs:seconds], 60
              jne  display
              
              mov  word [cs:seconds], 0   ; reset seconds
              inc  word [cs:minutes]      ; increment minutes
              
              cmp  word [cs:minutes], 60  ; check if minutes reached 60
              jne  display
              
              mov  word [cs:minutes], 0   ; reset minutes if reached 60
              
display:      call printtimer            ; display current time

skipall:      mov  al, 0x20 
              out  0x20, al              ; end of interrupt 
 
              pop  dx
              pop  cx
              pop  bx
              pop  ax 
              iret                       ; return from interrupt 

printbox:
    push bp
    mov bp, sp
    push di
    push ax
    push cx
    push bx
    push es


mov bx, 1
process: 
mov al, 160
mov ah, 0
mul bx
mov di, [bp+6]
add di, ax
mov ah, 0x30
mov cx,9
label: mov al, 186
mov [es: di], ax 
add di, 2
mov al, 255
mov [es: di], ax 
add di, 2
mov al, 255
mov [es: di], ax 
add di, 2
mov al, 255
mov [es: di], ax 
add di, 2
loop label
mov al, 186
mov [es: di], ax 
add bx, 1
cmp bx, 4
jl process

mov di, [bp+4]
mov ah, 0x30

mov al, 204
mov [es: di], ax 
add di, 2
mov cx, 8
label3: mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 206
mov [es: di], ax 
add di, 2
loop  label3
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 185
mov [es: di], ax 
add di, 2

pop es
pop bx
pop cx
pop ax
pop di
pop bp
ret 4



printscr: 
push bp
mov bp, sp
push es
push di
push ax
push si
push cx
push bx

mov ax, 0xb800
mov es, ax
mov di, 62
mov ah, 0x30
mov al, 201
mov [es:di], ax
add di, 2
mov cx,13
line1:
mov al, 205
mov [es:di], ax
add di, 2
loop line1
mov al, 187
mov [es:di], ax
add di, 2

mov di, 222
mov al, 186
mov [es:di], ax
add di, 2
mov al, 255
mov [es:di], ax
add di, 2
mov ah, 0x32
mov al, 83
mov [es:di], ax
add di, 2
mov al, 255
mov [es:di], ax
add di, 2
mov ah, 0x34
mov al, 85
mov [es:di], ax
add di, 2
mov al, 255
mov [es:di], ax
add di, 2
mov ah, 0x31
mov al, 68
mov [es:di], ax
add di, 2
mov al, 255
mov [es:di], ax
add di, 2
mov ah, 0x34
mov al, 85
mov [es:di], ax
add di, 2
mov al, 255
mov [es:di], ax
add di, 2
mov ah, 0x31
mov al, 75
mov [es:di], ax
add di, 2
mov al, 255
mov [es:di], ax
add di, 2
mov ah, 0x32
mov al, 79
mov [es:di], ax
add di, 2
mov al, 255
mov [es:di], ax
add di, 2
mov ah, 0x30
mov al, 186
mov [es:di], ax

mov di, 382
mov ah, 0x30
mov al, 200
mov [es:di], ax
add di, 2
mov cx,13
line2:
mov al, 205
mov [es:di], ax
add di, 2
loop line2
mov al, 188
mov [es:di], ax


;********

mov di, 482
mov si, [bp+14]
mov cx, [bp+12]
mov ah, 0x3C

nextchar1: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop nextchar1

    mov di, 546
mov si, [bp+10]
mov cx, [bp+8]
mov ah, 0x3C

nextchar2: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop nextchar2

    mov di, 614
mov si, [bp+6]
mov cx, [bp+4]
mov ah, 0x3C

nextchar3: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop nextchar3
mov di, 4454
mov si, [bp+6]
mov cx, [bp+4]
mov ah, 0x3C

timer2nd: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop timer2nd

;adding input instructions
mov di, 1442
mov si, game1
mov cx, 17
cld 
printgame1:
    lodsb
    stosw
    loop printgame1

mov di, 1602
mov si, game2
mov cx, 19
printgame2:
    lodsb
    stosw
    loop printgame2

mov di, 1762
mov si, game3
mov cx, 19
printgame3:
    lodsb
    stosw
    loop printgame3

mov di, 1924
mov si, game4
mov cx, 11
printgame4:
    lodsb
    stosw
    loop printgame4

mov di, 2084
mov si, game5
mov cx, 11
printgame5:
    lodsb
    stosw
    loop printgame5

mov di, 2244
mov si, game6
mov cx, 13
printgame6:
    lodsb
    stosw
    loop printgame6

mov di, 1554
mov si, game7
mov cx, 22
printgame7:
    lodsb
    stosw
    loop printgame7

mov di, 1714
mov si, game8
mov cx, 15
printgame8:
    lodsb
    stosw
    loop printgame8

mov di, 680
mov ah, 0x30

mov al, 201
mov [es: di], ax 
add di, 2
mov cx, 8
label1: mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 203
mov [es: di], ax 
add di, 2
loop  label1
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 187
mov [es: di], ax 
add di, 2


mov di, 680
push di
mov di, 1320
push di
call printbox
mov di, 1320
push di
mov di, 1960
push di
call printbox
mov di, 1960
push di
mov di, 2600
push di
call printbox
mov di, 2600
push di
mov di, 3240
push di
call printbox
mov di, 3240
push di
mov di, 3880
push di
call printbox

;out of screen box printing
mov di, 3880
push di
mov di, 4520
push di
call printbox
mov di, 4520
push di
mov di, 5160
push di
call printbox
mov di, 5160
push di
mov di, 5800
push di
call printbox

;9th row being printed
mov bx, 1
process1: 
mov al, 160
mov ah, 0
mul bx
mov di, 5800
add di, ax
mov ah, 0x30
mov cx,9
last: mov al, 186
mov [es: di], ax 
add di, 2
mov al, 255
mov [es: di], ax 
add di, 2
mov al, 255
mov [es: di], ax 
add di, 2
mov al, 255
mov [es: di], ax 
add di, 2
loop last
mov al, 186
mov [es: di], ax 
add bx, 1
cmp bx, 4
jl process1

mov di, 6440   
mov ah, 0x30

mov al, 200
mov [es: di], ax 
add di, 2
mov cx, 8
last2: mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 202
mov [es: di], ax 
add di, 2
loop  last2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 205
mov [es: di], ax 
add di, 2
mov al, 188
mov [es: di], ax 
add di, 2


;instruction messages
mov di, 804
mov si, [bp+26]
mov cx, [bp+24]
mov ah, 0x3C

nextchar4: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop nextchar4

mov di, 964
mov si, [bp+22]
mov cx, [bp+20]
mov ah, 0x3C

nextchar5: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop nextchar5

mov di, 1124
mov si, [bp+18]
mov cx, [bp+16]
mov ah, 0x3C

nextchar6: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop nextchar6

    ;fillimg random dummy values
    mov di, 1004
    mov ah, 0x30
    mov al, 49
    mov[es:di], ax
    mov cx, 8
    filler: add di, 648
    add al, 1
    mov[es:di], ax
    loop filler

;Printing tiles

mov ax, '1'
push ax
mov di, 6746
push di
call printTiles

mov ax, '2'
push ax
mov di, 6758
push di
call printTiles

mov ax, '3'
push ax
mov di, 6770
push di
call printTiles

mov ax, '4'
push ax
mov di, 6782
push di
call printTiles

mov ax, '5'
push ax
mov di, 6794
push di
call printTiles

mov ax, '6'
push ax
mov di, 6806
push di
call printTiles

mov ax, '7'
push ax
mov di, 6818
push di
call printTiles

mov ax, '8'
push ax
mov di, 6830
push di
call printTiles

mov ax, '9'
push ax
mov di, 6842
push di
call printTiles

pop bx
pop cx
pop si
pop ax
pop di
pop es
pop bp
ret

;PRINTS NUMBER TILES
printTiles:
    push bp
    mov bp, sp
    push ax
    push di
    push si
    push es
    push cx

    mov ax, 0xb800
    mov es, ax
    mov di, [bp + 4]


    mov ah, 0x30
    mov al, 201
    mov [es: di], ax 
    add di, 2
    mov cx, 3
    firstRow: 
        mov al, 205
        mov [es: di], ax
        add di, 2
        loop firstRow
    mov al, 187
    mov [es: di], ax 
    add di, 2
    
    mov di, [bp + 4]
    add di, 160
    
    mov al, 186
    mov [es: di], ax 
    add di, 2
    mov cx, 3
    secondRow:
        mov al, 255
        mov [es: di], ax
        add di, 2
        loop secondRow
    mov al, 186
    mov [es: di], ax 
    add di, 2

    mov di, [bp + 4]
    add di, 320
    
    mov al, 186
    mov [es: di], ax 
    add di, 2
    mov cx, 3
    thridRow:
        mov al, 255
        mov [es: di], ax
        add di, 2
        mov al, [bp + 6]
        mov [es: di], ax
        add di, 2
        mov al, 255
        mov [es: di], ax
        add di, 2
    
    mov al, 186
    mov [es: di], ax 
    add di, 2

    mov di, [bp + 4]
    add di, 480

    mov al, 186
    mov [es: di], ax 
    add di, 2
    mov cx, 3
    fourthRow:
        mov al, 255
        mov [es: di], ax
        add di, 2
        loop fourthRow
    
    mov al, 186
    mov [es: di], ax 
    add di, 2

    mov di, [bp + 4]
    add di, 640

    mov al, 200
    mov [es: di], ax 
    add di, 2

    mov cx, 3
    lastRow:
        mov al, 205
        mov [es: di], ax 
        add di, 2
        loop lastRow
    mov al, 188
    mov [es: di], ax 
    add di, 2

    pop cx
    pop es
    pop si
    pop di
    pop ax
    pop bp
    ret 4





storeScreen: ;used to store initial screen for scroll down
    push bp
    mov bp, sp
    push ax
    push cx
    push ds
    push si
    push es
    push di

    mov ax, 0xb800
    mov es, ax
    mov ds, ax
    mov si, [bp + 8]
    mov cx, [bp + 4]
    mov di, [bp + 6]
    cld
    rep movsw

    pop di
    pop es 
    pop si
    pop ds
    pop cx
    pop ax
    pop bp
    ret 6


scrollup:     
    push bp 
    mov  bp,sp 
    push ax 
    push cx 
    push si   
    push di 
    push es 
    push ds 

    mov si, 3880          
    mov  cx, 2000         
    mov  ax, 0xb800 
    mov  es, ax            
    mov  ds, ax            
    mov di, 40             
    cld                    
    rep  movsw             

    pop  ds 
    pop  es 
    pop  di 
    pop  si 
    pop  cx 
    pop  ax 
    pop  bp 
    ret  


scrolldown:   
    push bp 
    mov  bp,sp 
    push ax 
    push cx 
    push si   
    push di 
    push es 
    push ds 

    mov  si, 10000          
    mov  cx, 2000                 
    mov  ax, 0xb800 
    mov  es, ax             
    mov  ds, ax             
    mov  di, 0         
    cld                
    rep  movsw              
    mov  ax, 0x0320         
   

    ;call displayMistakeAndScore


    pop  ds 
    pop  es 
    pop  di 
    pop  si 
    pop  cx 
    pop  ax 
    pop  bp 
    ret  



clrscrGameOver:
    push ax
    push es
    push di
    mov ax, 0xb800
    mov es, ax
    mov di, 0

    nextlocGameOver: mov word [es:di], 0x3020 ; clear next char on screen 
    add di, 2 ; move to next screen location 
    cmp di, 4000 ; has the whole screen cleared 
    jne nextlocGameOver ; if no clear next position 
    pop di 
    pop ax 
    pop es 
    ret     


;IS VALID NOTES
isValidNotes:
    push ax
    push bx
    push dx 
    push si
    push di
    xor bx, bx
    mov bl, [rows]
    sub bl, 0x30
    sub bl , 1
    mov ax, 0
    mov al, 9
    mul bl

    mov si, ax

    xor bx, bx
    mov bl, [columns]
    sub bl, 0x30
    sub bl, 1
    xor ax, ax

    cmp byte [boardLevel], 'e'
    je EasyNotesValidity

    cmp byte [boardLevel], 'm'
    je MediumNotesValidity
    
    cmp byte [boardLevel], 'h'
    je HardNotesValidity
    

    EasyNotesValidity:
    mov al, [Puzzle1+si+bx]
    jmp movingOn

    MediumNotesValidity:
    mov al, [Puzzle2+si+bx]
    jmp movingOn

    HardNotesValidity:
    mov al, [Puzzle3+si+bx]
    jmp movingOn

    movingOn:
    cmp al, 0
    jne FunctionExit

    mov ax, 0
    mov bx, 0

    mov ax, 640
    mov bx, [rows]
    mov bh, 0
    sub bx, 0x30
    sub bx, 1
    mul bx

    mov di, 1004
    add di, ax

    mov bx, 0
    mov ax, 0
    mov al, 8
    mov bl, [columns]
    sub bl, 0x30
    sub bl, 1
    mul bl

    add di, ax

    xor ax, ax
    mov al, [cs:numberEntered]
    sub al, 0x30
    cmp al, 1
    je positionFor1
    cmp al, 2
    je positionFor2
    cmp al, 3
    je positionFor3
    cmp al, 4
    je positionFor4
    cmp al, 5
    je positionFor5
    cmp al, 6
    je positionFor6
    cmp al, 7
    je positionFor7
    cmp al, 8
    je positionFor8
    cmp al, 9
    je positionFor9
    jmp FunctionExit

    positionFor1:
    sub di, 162
    jmp PrintNote

    positionFor2:
    sub di, 160
    jmp PrintNote

    positionFor3:
    sub di, 158
    jmp PrintNote

    positionFor4:
    sub di, 2
    jmp PrintNote

    positionFor5:
    jmp PrintNote

    positionFor6:
    add di, 2
    jmp PrintNote

    positionFor7:
    add di, 158
    jmp PrintNote

    
    positionFor8:
    add di, 160
    jmp PrintNote


    positionFor9:
    add di, 162
    jmp PrintNote



    PrintNote:
    ; mov ax, 0xb800
    ; mov es, ax
    ; mov ah, 0x54
    ; mov al, [numberEntered]
    ; mov [es:di], ax    

    mov si, 0
    mov si, arrayForDi
    mov bx, 0

    mov cx, 10
    loopForindex:
    cmp byte[si], 0
    je Found
    add si, 2
    add bx, 1
    loop loopForindex


Found:
    mov [si], di
    mov al, [numberEntered]
    sub al, 0x30
    mov byte[arrayForNum+bx],al


    FunctionExit:
    pop di
    pop si
    pop dx
    pop bx
    pop ax

    ret



;IS VALID MOVE FUNC
isValidMove:
push ax
push bx

push dx
push si

xor bx, bx
mov bl, [rows]
sub bl, 0x30
sub bl , 1
mov ax, 0
mov al, 9
mul bl

mov si, ax


xor bx, bx
mov bl, [columns]
sub bl, 0x30
sub bl, 1

mov al, [PuzzleKey+si+bx]
mov byte[valueRetrieved], al

cmp byte[boardLevel], 'e'
je CheckingEasyMode

cmp byte[boardLevel], 'm'
je CheckingMediumMode

cmp byte[boardLevel], 'h'
je CheckingHardMode

CheckingEasyMode:
mov al, [Puzzle1+si+bx]
cmp al, 0
jne noMove

xor ax, ax
mov al, [numberEntered]
sub al, 0x30
mov dl, al
mov [Puzzle1+si+bx],dl
jmp afterSelection

CheckingMediumMode:
mov al, [Puzzle2+si+bx]
cmp al, 0
jne noMove

xor ax, ax
mov al, [numberEntered]
sub al, 0x30
mov dl, al
mov [Puzzle2+si+bx],dl
jmp afterSelection

CheckingHardMode:
mov al, [Puzzle3+si+bx]
cmp al, 0
jne noMove

xor ax, ax
mov al, [numberEntered]
sub al, 0x30
mov dl, al
mov [Puzzle3+si+bx],dl
jmp afterSelection


afterSelection:

mov ah, [valueRetrieved]

cmp ah, al
jne setZero
mov byte[moveFlag], '1'
jmp exitFunction

setZero:
mov byte[moveFlag], '0'
jmp exitFunction

noMove:
    mov byte[moveFlag], '2'


exitFunction:

pop si
pop dx
pop bx
pop ax

ret





printLineGameOver:
    push bp
    mov bp, sp
    push si
    push cx
    push di
    push ax
    push es

    mov ax, 0xb800
    mov es, ax  

    mov ah, 0xB6
    mov si, [bp + 8]
    mov cx, [bp + 6]
    mov di, [bp + 4]
    

nextLetterGameOver: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop nextLetterGameOver

    pop es
    pop ax
    pop di
    pop cx
    pop si
    pop bp
    ret 6


printText:
    push bp 
    mov bp, sp
    push es
    push di
    push ax
    push si
    push cx
    push dx
    push bx

    mov ax, 0xb800
    mov es, ax   

;1st line
    mov si, firstLine ;msg
    push si
    mov cx, 56 ;len
    push cx
    mov di, 1144 ;postion
    push di
    call printLineGameOver

;2nd line
    mov si, secondLine ;msg
    push si
    mov cx, 56 ;len
    push cx
    mov di, 1304 ;postion
    push di
    call printLineGameOver
;3rd line
    mov si, thirdLine ;msg
    push si
    mov cx, 56 ;len
    push cx
    mov di, 1464 ;postion
    push di
    call printLineGameOver
;4th line
    mov si, fourthLine ;msg
    push si
    mov cx, 56 ;len
    push cx
    mov di, 1624 ;postion
    push di
    call printLineGameOver
;5th line
    mov si, fifthLine ;msg
    push si
    mov cx, 56 ;len
    push cx
    mov di, 1784 ;postion
    push di
    call printLineGameOver                                            


    pop bx
    pop dx
    pop cx
    pop si
    pop ax
    pop di
    pop es
    pop bp
    ret 


printNumOnScreen:     
    push bp 
    mov  bp, sp 
    push es 
    push ax 
    push bx 
    push cx 
    push dx 
    push di 

    mov ax, 0xb800
    mov es, ax
    xor ax, ax
    mov di, [bp+6]      
    mov ax, [bp+4]     
    mov  bl, 10 
    div  bl             
    add  ah, 0x30       
    mov  dl, ah
    cmp dl, 48
    jne skipSpace
    mov dl, 32
    skipSpace:
    mov  dh, 0x30       
    mov  [es:di], dx                       
    
    pop  di 
    pop  dx 
    pop  cx 
    pop  bx 
    pop  ax 
    pop  es 
    pop  bp 
    ret  4



    
printTileOnScreen:     
    push bp 
    mov  bp, sp 
    push es 
    push ax 
    push bx 
    push cx 
    push dx 
    push di 

    mov ax, 0xb800
    mov es, ax
    xor ax, ax
    mov di, [bp+6]      
    mov ax, [bp+4]     
    mov  bl, 10 
    div  bl             
    add  ah, 0x30       
    mov  dl, ah        
    mov  dh, 0x3C       
    mov  [es:di], dx                       
    
    pop  di 
    pop  dx 
    pop  cx 
    pop  bx 
    pop  ax 
    pop  es 
    pop  bp 
    ret  4


;fillboard
FillingBoard:
    push bp
    mov bp, sp
    sub sp, 2 ;local var
    push es
    push di
    push ax
    push si
    push cx
    push dx
    push bx

    mov ax, 0xb800
    mov es, ax
    xor ax, ax
    mov word [bp - 2], 9 ;counter for outer loop
    mov di, 1004
    mov bx, 0
    cmp byte [boardLevel], 'e'
    je setPuzzle1

    cmp byte [boardLevel], 'm'
    je setPuzzle2
    
    cmp byte [boardLevel], 'h'
    je setPuzzle3

    setPuzzle1:
        mov si, Puzzle1
        jmp OuterloopFilling
    setPuzzle2:
        mov si, Puzzle2
        jmp OuterloopFilling
    setPuzzle3:
        mov si, Puzzle3
        jmp OuterloopFilling

    OuterloopFilling:
        mov dx, di ;stores di initial val
        mov cx, 9
        innerloopFilling:

            push di
            add di, 8
            mov al, [si + bx]
            push ax
            call printNumOnScreen
            inc bx
            loop innerloopFilling
        mov di, dx
        add di, 640
        sub word [bp - 2], 1
        cmp word [bp - 2], 0
        jne OuterloopFilling

  mov ax, 0xb800
        mov es, ax
        mov ax, 0
        mov cx, 10
        mov bx, 0
        mov si, arrayForDi
        loopCheck:
        cmp word[si], 0
        je breakPoint    
        mov di, [si]
        mov al, [arrayForNum+bx]
        add al, 0x30
        mov ah, 0x35
        mov [es:di], ax
        add bx, 1
        add si, 2
        loop loopCheck

breakPoint:
    pop bx
    pop dx
    pop cx
    pop si
    pop ax
    pop di
    pop es
    mov sp, bp
    pop bp
    ret

printend:
    push bp 
    mov bp, sp
    push es
    push di
    push ax
    push si
    push cx
    push dx
    push bx

    mov ax, 0xb800
    mov es, ax     
    mov al, 80
    mul byte [bp+8]
    add ax, [bp+10]
    shl ax, 1
    xor di, di
    mov di, ax
    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, [bp + 12]

nextChar: 
    mov al, [si]
    mov [es:di], ax
    add di, 2
    add si, 1
    loop nextChar

    pop bx
    pop dx
    pop cx
    pop si
    pop ax
    pop di
    pop es
    pop bp
    ret 10


FillingTiles:
    push es
    push di
    push ax
    push si
    push cx
    push dx
    push bx

    mov ax, 0xb800
    mov es, ax
    xor ax, ax
    mov di, 7550
    mov bx, 0

    cmp byte [boardLevel], 'e'
    je setFillingTilesCount1

    cmp byte [boardLevel], 'm'
    je setFillingTilesCount2
    
    cmp byte [boardLevel], 'h'
    je setFillingTilesCount3

    setFillingTilesCount1:
        mov si, countforNumbers1
        jmp adding_tiles

    setFillingTilesCount2:
        mov si, countforNumbers2
        jmp adding_tiles

    setFillingTilesCount3:
        mov si, countforNumbers3
        jmp adding_tiles

    adding_tiles:
       mov cx, 9
        Filling:
            push di
            add di, 12
            mov al, [si + bx]
            push ax
            call printTileOnScreen
            inc bx
            loop Filling
      
    pop bx
    pop dx
    pop cx
    pop si
    pop ax
    pop di
    pop es
    ret  

displayMistakeAndScore:
    push es
    push ax
    push di

    mov ax, 0xb800
    mov es, ax

    mov ax, 0

    mov di, 512
    push di
    mov al, [mistakeCount]
    push ax
    call printnum


    xor ax, ax

    mov di, 560
    push di
    mov al, [Gamescore]
    push ax
    call printnum


    pop di
    pop ax
    pop es
    ret


Updatevalues:
push ax
push bx 

mov ax, 0
mov bx, 0
mov al, [moveFlag]
sub al, 0x30

cmp al, 1       ;is move valid or not
je ValidMove
cmp al, 0
jne exit


notValidMove:
mov ax, 0
mov al, [mistakeCount]
add al, 1
mov byte[mistakeCount], al

jmp exit


ValidMove:
mov bl, [numberEntered]
sub bl, 0x30
sub bl, 1

mov ax, 0
cmp byte [boardLevel], 'e'
je CountForEasy

cmp byte [boardLevel], 'm'
je CountForMedium

cmp byte [boardLevel], 'h'
je CountForHard


CountForEasy:
mov al, [countforNumbers1 + bx]
sub al, 1
mov byte[countforNumbers1 + bx], al
jmp afterStoringCount

CountForMedium:
mov al, [countforNumbers2 + bx]
sub al, 1
mov byte[countforNumbers2 + bx], al
jmp afterStoringCount

CountForHard:
mov al, [countforNumbers3 + bx]
sub al, 1
mov byte[countforNumbers3 + bx], al
jmp afterStoringCount


afterStoringCount:
mov ax, 0
mov al, [Gamescore]
add al, 2
mov byte[Gamescore], al

exit:
pop bx
pop ax
ret



checkForWinningLose:
push ax
push bx
push dx
push si
push cx

mov ax, 0
mov al, [mistakeCount]
cmp al, 3
jl NotLose
mov byte[WinFlag], '0'
jmp FunctionExit2



NotLose:
;checking which level
cmp byte[boardLevel], 'e'
je NotLoseEasy

cmp byte[boardLevel], 'm'
je NotLoseEasy2

cmp byte[boardLevel], 'h'
je NotLoseEasy3

NotLoseEasy:
    mov si, countforNumbers1
    jmp NotLosing

NotLoseEasy2:
    mov si, countforNumbers2
    jmp NotLosing

NotLoseEasy3:
    mov si, countforNumbers3
    jmp NotLosing

NotLosing:
mov bx, 0
mov cx, 9
myLoop:
mov al, [si+bx]
cmp al, 0
jne FunctionExit2
add bx, 1
loop myLoop

mov byte[WinFlag], '1'


FunctionExit2:
pop cx
pop si
pop dx
pop bx
pop ax
ret




EraseFunction:
    push ax 
    push bx
    push si
    push dx

     xor bx, bx
    mov bl, [rows]
    sub bl, 0x30
    sub bl , 1
    mov ax, 0
    mov al, 9
    mul bl

    mov si, ax

    xor bx, bx
    mov bl, [columns]
    sub bl, 0x30
    sub bl, 1

    mov al, byte[boardLevel]
    cmp al, 'e'
    je checkForEasy
    cmp al, 'm'
    je checkForMedium
    cmp al, 'h'
    je checkForHard

    checkForEasy:
        mov al, [Puzzle1+bx+si]
        cmp al, 0
        je FunctionExit3
        mov byte[eraseValue], al
        mov al, 0
        mov [Puzzle1+bx+si], al
        mov al, [eraseValue]
        sub al, 1
        mov ah, 0
        mov bx, ax
        mov al, [countforNumbers1+bx]
        add ax, 1
        mov [countforNumbers1+bx],al

        jmp FunctionExit3


    checkForMedium:              
        mov al, [Puzzle2+bx+si]
        cmp al, 0
        je FunctionExit3
        mov byte[eraseValue], al
        mov al, 0
        mov [Puzzle2+bx+si], al
        mov al, [eraseValue]
        sub al, 1
        mov ah, 0
        mov bx, ax
        mov al, [countforNumbers2+bx]
        add ax, 1
        mov [countforNumbers2+bx],al

        jmp FunctionExit3


    checkForHard:
        mov al, [Puzzle3+bx+si]
         cmp al, 0
        je FunctionExit3
        mov byte[eraseValue], al
        mov al, 0
        mov [Puzzle3+bx+si], al
        mov al, [eraseValue]
        sub al, 1
        mov ah, 0
        mov bx, ax
        mov al, [countforNumbers3+bx]
        add ax, 1
        mov [countforNumbers3+bx],al

        jmp FunctionExit3

    FunctionExit3:   
    pop dx
    pop si
    pop bx
    pop ax
    ret




;generates sound
sound:
    push ax
    push bx
    push cx

    mov al, 10110110b
    out 0x43, al
    mov ax, 1193
    out 0x42, al
    mov al, ah
    out 0x42, al
    
    in al, 0x61
    or al, 3
    out 0x61, al

    mov cx, 1000
delay_outer:
    push cx
    mov bx, 500
delay_inner:
    dec bx
    jnz delay_inner
    pop cx
    dec cx
    jnz delay_outer

    in al, 0x61
    and al, 0xFC
    out 0x61, al

    pop cx
    pop bx
    pop ax
    ret

;check for row/column completion
CheckRowColCompletion:
pusha
mov bl, [rows]
sub bl, 0x30
sub bl , 1
mov ax, 0
mov al, 9
mul bl ;bl pointing to correct start of row
mov si, ax

cmp byte [boardLevel], 'e'
je Puzzle1Checking

cmp byte [boardLevel], 'm'
je Puzzle2Checking

cmp byte [boardLevel], 'h'
je Puzzle3Checking

;for easy
Puzzle1Checking:
xor bx, bx
mov cx, 8
checkingRow1:
    cmp byte[Puzzle1+si+bx], 0
    je ColStart1
    inc bx
    loop checkingRow1
    call sound

ColStart1:
xor ax, ax
mov cx, 9
xor si, si
xor bx, bx
mov bl, [columns]
sub bl, 0x30
sub bl, 1

CheckCol1:
    cmp byte [Puzzle1+bx+si], 0
    je checkRowColEnd
    add si, 9 ; to jump to next col
    loop CheckCol1
    call sound
    je checkRowColEnd

;for medium
Puzzle2Checking:
xor bx, bx
mov cx, 8
checkingRow2:
    cmp byte[Puzzle2+si+bx], 0
    je ColStart2
    inc bx
    loop checkingRow2
    call sound

ColStart2:
xor ax, ax
mov cx, 9
xor si, si
xor bx, bx
mov bl, [columns]
sub bl, 0x30
sub bl, 1

CheckCol2:
    cmp byte [Puzzle2+bx+si], 0
    je checkRowColEnd
    add si, 9 ; to jump to next col
    loop CheckCol2
    call sound
    je checkRowColEnd

;for hard
Puzzle3Checking:
xor bx, bx
mov cx, 8
checkingRow3:
    cmp byte[Puzzle3+si+bx], 0
    je ColStart3
    inc bx
    loop checkingRow3
    call sound

ColStart3:
xor ax, ax
mov cx, 9
xor si, si
xor bx, bx
mov bl, [columns]
sub bl, 0x30
sub bl, 1

CheckCol3:
    cmp byte [Puzzle3+bx+si], 0
    je checkRowColEnd
    add si, 9 ; to jump to next col
    loop CheckCol3
    call sound
    je checkRowColEnd

checkRowColEnd:
popa
ret



generate_sound2:
    push cx
    mov al, 0xB6
    out 0x43, al
    out 0x42, al
    mov al, ah
    out 0x42, al
    in al, 0x61
    or al, 0x03
    out 0x61, al
    mov cx, 10000
 delay_loop:
    loop delay_loop
    in al, 0x61
    and al, 0xFC
    out 0x61, al
    pop cx
    ret




EraseAllNotes:
    push ax
    push bx
    push si
    push cx

    mov si, 0
    mov cx, 10
    mov si, arrayForDi
    mov bx, arrayForNum

    eraseLoop:
        mov word[si], 0
         mov byte[bx], 0
        add bx, 1
        add si, 2
        loop eraseLoop


    pop cx
    pop si
    pop bx
    pop ax
    ret


;---------------------------START---------------------------
start: 

call clrStartScreen

mov ax, startScreenMessage1
push ax
push word[startScreenlength1]
mov ax, startScreenMessage2
push ax
push word[startScreenlength2]
mov ax, startScreenMessage3
push ax
push word[startScreenlength3]
call printStartScreen

mov ax, 0
push ax
mov ax, 10000
push ax
mov ax, 2000
push ax
call storeScreen ;storing initial screen



mainloop:
call checkForWinningLose
cmp byte[WinFlag], '0'
je printGameOver
cmp byte[WinFlag], '1'
je printWinGame
xor dx, dx
mov ah, 0
int 16h
mov dl, al
mov bl, ah
cmp bl, 0x2D
je printGameOver
cmp bl, 0x31
je inputNotes
cmp bl, 0x22
je inputNumber
cmp bl, 0x48
je movedown
cmp bl, 0x50
je moveup
cmp bl, 0x12    ;easy
je printBoard
cmp bl, 0x32    ;medium
je printBoard
cmp bl, 0x23    ;hard
je printBoard
cmp bl, 0x16 ;u for erase
je eraseMove
cmp bl, 0x2C    ;z for eraseNotes
je eraseNotes 

jmp skip


printWinGame:
cli                      ; disable interrupts
mov  word [es:8*4], oldisr ; store offset at n*4 
mov  [es:8*4+2], cs      ; store segment at n*4+2 
sti    

call Winclrscr
    call printWinText
    mov ax, 0x34
    push ax
    mov ax, 30 ;column
    push ax
    mov ax, 11 ;row
    push ax
    mov ax, WinMessage
    push ax
    push word[len]
    call printWinend


    mov ax, 0x34
    push ax
    mov ax, 30
    push ax
    mov ax, 13  
    push ax
    mov ax, exitMessage
    push ax
    mov ax, 21
    push ax
    call printWinend


    jmp end


eraseNotes:

    call EraseAllNotes

    call scrollup
    call scrolldown
    call FillingBoard
    call displayMistakeAndScore
    jmp skip

printGameOver:
cli                      ; disable interrupts
mov  word [es:8*4], oldisr ; store offset at n*4 
mov  [es:8*4+2], cs      ; store segment at n*4+2 
sti   

call clrscrGameOver
   ; call isValidMove
    call printText
    mov ax, 0x34
    push ax
    mov ax, 30 ;column
    push ax 
    mov ax, 15 ;row 
    push ax
    mov ax, exitMessage
    push ax
    mov ax, 22
    push ax
    call printend
    
    jmp end

printBoard:
call clrscr

;storing the level
mov [boardLevel], dl


mov ax, message4
push ax
push word[length4]
mov ax, message5
push ax
push word[length5]
mov ax, message6
push ax
push word[length6]
mov ax, message1
push ax
push word[length1]
mov ax, message2
push ax
push word[length2]
mov ax, message3
push ax
push word[length3]
call printscr


; adding values into board

call FillingBoard
call FillingTiles
call displayMistakeAndScore

xor  ax, ax 
mov  es, ax               ; point es to IVT base 

; save old interrupt vector
mov  ax, [es:8*4]
mov  [oldisr], ax
mov  ax, [es:8*4+2]
mov  [oldisr+2], ax

cli                      ; disable interrupts
mov  word [es:8*4], timer ; store offset at n*4 
mov  [es:8*4+2], cs      ; store segment at n*4+2 
sti                      ; enable interrupts 

mov ax, 0
push ax
mov ax, 10000
push ax
mov ax, 2000
push ax
call storeScreen ;storing initial screen

jmp skip


inputNumber:
mov ax,0
int 16h
mov [rows], al
mov ax, 0
int 16h
mov [columns], al
mov ax, 0
int 16h
mov [numberEntered], al
call isValidMove
call Updatevalues
call FillingTiles
call FillingBoard
call displayMistakeAndScore
call CheckRowColCompletion
call generate_sound2
jmp eraseNotes

jmp skip

eraseMove:
mov ax,0
int 16h
mov [rows], al
mov ax, 0
int 16h
mov [columns], al
call EraseFunction
call FillingBoard
call FillingTiles
jmp skip    

inputNotes:
mov ax,0
int 16h
mov [rows], al
mov ax, 0
int 16h
mov [columns], al
mov ax, 0
int 16h
mov [numberEntered], al
call isValidNotes
call FillingBoard
jmp skip

moveup:
    call scrollup
    jmp skip
movedown:
    call scrolldown
    call displayMistakeAndScore
    call FillingBoard

   
skip:
    jmp mainloop

end:
mov ax,0x4C00
int 21h