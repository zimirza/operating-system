BITS 16
ORG 0x7C00

JMP _start

title_end:
  RET

title:
  MOV AH, 0x000E
  MOV AL, [BX]
  CMP AL, 0
  JE title_end
  INT 0x0010

  INC BX
  JMP title

_start:
  MOV AH, 0x0006
  MOV BH, 0x001F
  MOV DX, 0x184F
  INT 0x0010

  MOV AH, 0x0002
  MOV BH, 0x0000
  MOV DH, 0x0000
  MOV DL, 0x0000
  INT 0x0010

  MOV BX, program_title
  CALL title
  MOV AH, 0x0002
  MOV BH, 0x0000
  INC DH
  INT 0x0010

  JMP $

program_title DB "Bootloader", 0

TIMES 510-($-$$) DB 0
DW 0xAA55