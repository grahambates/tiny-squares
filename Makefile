MODEL=A500
BIN_DIR = ~/amiga/bin
VASM = ~/amiga/bin/vasmm68k_mot
VASM_ARGS = -m68000 -x -opt-size -showopt -Fhunkexe -kick1hunks -nosym -pic
FS_UAE = /Applications/FS-UAE-3.app/Contents/MacOS/fs-uae
FS_UAE_ARGS = --hard_drive_0=out --amiga_model=$(MODEL) --automatic_input_grab=0
EXE2ADF = $(BIN_DIR)/exe2adf

out/main: main.asm
	$(VASM) $(VASM_ARGS) -o $@ $<

run: out/main
	$(FS_UAE) $(FS_UAE_ARGS)

out/main.adf: out/main Makefile
	$(info )
	$(info Creating ADF)
	$(EXE2ADF) -i out/main -a $@

