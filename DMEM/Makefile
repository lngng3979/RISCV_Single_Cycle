tb.exe: *.v
	iverilog -g2005-sv DMEM_fix.v DMEM_tb.v
data_memory_tb.vcd:
	./a.out
debug:
	gtkwave debug_memory_tb.vcd
all : 	tb.exe data_memory_tb.vcd debug
clean :
	rm -rf a.out data_memory_tb.vcd
