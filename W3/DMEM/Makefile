DMEM_tb: *.v *.data
	iverilog -g2005-sv *.v
DMEM.vcd:
	./a.out
debug:
	gtkwave DMEM.vcd
all : DMEM_tb DMEM.vcd debug
clean :
	rm -rf a.out DMEM.vcd
