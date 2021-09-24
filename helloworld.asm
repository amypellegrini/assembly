; nasm -f macho64 helloworld.asm && ld -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -macosx_version_min 11.6.0 -no_pie -lSystem -o helloworld helloworld.o && ./helloworld

        global  _main

        section .text
_main:  mov     rax, 0x2000004  ; system call for write
        mov     rdi, 1          ; file handle 1 is stdout
        mov     rsi, msg        ; address of string to output
        mov     rdx, msg.len    ; number of bytes
        syscall                 ; invoke operating system to do the write
        mov     rax, 0x2000001  ; system call for exit
        mov     rdi, 0          ; exit code 0
        syscall                 ; invoke operating system to exit

        section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg