format ELF64

public _start
extrn 'InitWindow' as InitWindow
extrn 'CloseWindow' as CloseWindow
extrn 'BeginDrawing' as BeginDrawing
extrn 'EndDrawing' as EndDrawing
extrn 'ClearBackground' as ClearBackground
extrn 'WindowShouldClose' as WindowShouldClose

_start:
        mov rdi, 800
        mov rsi, 600
        mov rdx, txt
        call InitWindow


.again:
        call BeginDrawing
        mov rdi, 0
        mov rsi, 0
        call ClearBackground

        call EndDrawing



        call WindowShouldClose
        cmp rax, 0
        je .again

        call CloseWindow
        
        mov rdi, 0
        mov rax, 60
        syscall
        ret


txt: db "Hello from Assembly!", 0
