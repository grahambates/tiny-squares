MODEL=A500
VASM = vasmm68k_mot
VASM_ARGS = -m68000 -x -opt-size -showopt -Fhunkexe -kick1hunks -nosym -pic
FS_UAE = /Applications/FS-UAE-3.app/Contents/MacOS/fs-uae
FS_UAE_ARGS = --hard_drive_0=out --amiga_model=$(MODEL)

out/main: main.asm
	$(VASM) $(VASM_ARGS) -o $@ $<

run: out/main
	$(FS_UAE) $(FS_UAE_ARGS)
