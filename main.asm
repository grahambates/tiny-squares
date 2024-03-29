                incdir  "include"
                include "graphics/graphics_lib.i"
                include "intuition/screens.i"

Main:
                move.l  $170(a2),a6     ; intuitionbase from globvec
                move.l  ib_ActiveScreen(a6),a5
                move.l  $4.w,a6         ; execbase
                move.l  156(a6),a6      ; graphics.library

                lea     sc_RastPort(a5),a1
                jsr     _LVOClearScreen(a6)
.l:
                ; jsr     _LVOWaitTOF(a6)
                addq.w  #1,d4           ; inc frame
                move.w  d4,d0
                lsr.w   #7,d0
                ; lea     sc_RastPort(a5),a1 ; WaitTOF trashed this :-(
                jsr     _LVOSetAPen(a6)
                clr.w   d7
.y:
                move.b  d4,d0           ; x = frame^y
                eor.w   d7,d0
                add.w   d0,d0           ; correct aspect
                move.w  d7,d1           ; y
                add.w   #64,d0          ; center
                jsr     _LVOWritePixel(a6)

                addq.b  #1,d7
                bcc.b   .y
                bra.b   .l

