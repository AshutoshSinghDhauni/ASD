.data 
      Hello:
            .asciz "Hello World!\n"
      Hellof:
            .asciz "Hello Function!\n"
.bss
    .lcomm StringPointer,4
    .lcomm StringLength,4
.text
     .globl _start

     .type Myfunction,@function
      
      Myfunction:
               movl $4,%eax
               movl $1,%ebx
               movl StringPointer,%ecx
               movl StringLength,%edx
               int $0x80
               ret
     _start:
            nop
            
            movl $Hello,StringPointer
            movl $14,StringLength
            call Myfunction

            movl $Hellof,StringPointer
            movl $17,StringLength
            call Myfunction

            #Exit
            Exit:
            movl $1,%eax
            movl $0,%ebx
            int $0x80
    
