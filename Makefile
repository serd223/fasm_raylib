LIBS = -dynamic-linker /lib64/ld-linux-x86-64.so.2 -Lraylib/lib/ -lm -l:libraylib.a -lc 

default: build/main

build/main: build/main.o
	ld build/main.o $(LIBS) -m elf_x86_64 -o build/main

build/main.o: main.asm
	fasm main.asm build/main.o


