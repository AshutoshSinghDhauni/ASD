.data
     hello:
           .ascii "Hell! World\n"
.text


.global _start
_start:
             #load all the arguments for write()
  movl $4,%eax
  movl $1,%ebx
  movl $hello,%ecx
  movl $12,%edx
  int $0x80

  #need to exit the program

  movl $1,%eax
  movl $0,%ebx
  int $0x80


