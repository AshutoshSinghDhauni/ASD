.data
     hello:
           .asciz "Hello\n"
     zfs:
           .asciz "Zero Flag Set"
     zfns:
           .asciz "zero flag not set"
.text
     .globl _start
_start:
       nop
       movl $10,%eax
       xorl %eax,%eax       
       jz Print
          FlagNotSetPrint:
                          movl  $4,%eax
                          movl  $1,%ebx
                          leal zfns ,%ecx
                          movl $17,%edx
                          int $0x80
                          jmp Exit
           FlagSetPrint:
                         movl $4,%eax
                         movl $1,%ebx
                         leal zfs,%ecx
                         movl $13,%edx
                         int $0x80
                         jmp Exit
          Exit:
                movl $1, %eax
                movl $0, %ebx
                int $0x80
          Print:
                 movq $10, %rcx
                 Printtentimes:
                               pushq %rcx
                               movl $4,%eax
                               movl $1,%ebx
                               leal hello,%ecx
                               movl $7,%edx
                               int $0x80
                               popq %rcx
                               loop Printtentimes
                               jmp Exit
  
