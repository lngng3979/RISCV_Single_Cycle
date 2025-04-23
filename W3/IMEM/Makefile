IMEM_tb: *.v *.prog 
	iverilog -g2005-sv *.v 
IMEM.vcd: 
	./a.out
debug: 
	gtkwave IMEM.vcd
all : IMEM_tb IMEM.vcd debug
clean : 
	rm -rf a.out IMEM.vcd   
