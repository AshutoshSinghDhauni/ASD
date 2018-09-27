.data
     hello:
           .ascii "Hello World!"
     demo:
           .ascii "Call works!"
     bytel: 
           .byte 10
     int32:
           .int 100
     int16:
           .short 50
     floatl:
           .float 10.23
     intArray:
            .int 10,20,30,40,50


.bss
      .lcomm Destination, 100
      .lcomm DestinationR, 100
      .lcomm DestinationS, 100

.text
        .globl _start
_start:
        nop
       Call demoC
         movl $4,%eax
         movl $1,%ebx       
         movl $hello,%ecx
         movl $12,%edx
         int $0x80  
 
     Exit:
         movl $1,%eax
         movl $0,%ebx
         int $0x80
     
     demoC:
          cld
          
          leal hello,%esi
          lodsb
          movb $0,%al
          dec %esi
          int $0x80
          ret  

