format ELF64

public _start
extrn 'InitWindow' as InitWindow
extrn 'CloseWindow' as CloseWindow
extrn 'BeginDrawing' as BeginDrawing
extrn 'EndDrawing' as EndDrawing
extrn 'ClearBackground' as ClearBackground
extrn 'WindowShouldClose' as WindowShouldClose
extrn 'SetTargetFPS' as SetTargetFPS

_start:
        mov rdi, 800
        mov rsi, 600
        mov rdx, txt
        call InitWindow

        mov rdi, 144
        call SetTargetFPS

.again:
        ; - Drawing
        call BeginDrawing
        ;        0xaabbggrr
        mov edi, 0xff0000ff
        call ClearBackground

        call EndDrawing
        ; ---------

        ; - Loop condition
        call WindowShouldClose
        cmp rax, 0
        je .again
        ; ----------------

        ; - Cleanup
        call CloseWindow
        
        mov rdi, 0
        mov rax, 60
        syscall
        ret


txt: db "Hello from Assembly!", 0
