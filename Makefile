all: linker boot kernel
	grub-mkrescue -o myos.iso isodir

linker:
	i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc

kernel:
	i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

boot:
	i686-elf-as boot.s -o boot.o

run:
	qemu-system-i386 -cdrom myos.iso
