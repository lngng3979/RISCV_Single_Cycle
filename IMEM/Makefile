tb.exe: *.v
	iverilog -g2005-sv IMEM.v IMEM_tb.v
instruction_memory_tb.vcd: 
	./a.out
debug: 
	gtkwave instruction_memory_tb.vcd
all : tb.exe instruction_memory_tb.vcd debug
clean : 
	rm -rf a.out instruction_memory_tb.vcd   
