C_ARGS = -Wall -Wextra -pedantic -Iraylib/include/
LIBS = -dynamic-linker /lib64/ld-linux-x86-64.so.2 -Lraylib/lib/ -lm -l:libraylib.a -lc 


default: build/main

build/main.o: main.asm
	fasm main.asm build/main.o

build/main: build/main.o
	ld build/main.o $(LIBS) -m elf_x86_64 -o build/main

gen: test.c
	clang -S -masm=intel -c test.c $(C_ARGS) -o build/test.asm


# Create .clangd file for LSP
comma := ,
empty :=
space := $(empty) $(empty)
FLAGS_LIST = $(subst $(space),$(comma),$(C_ARGS))
a := $(file > .clangd, CompileFlags:)
b := $(file >> .clangd, 	Add: [$(FLAGS_LIST)])
