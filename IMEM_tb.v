module Instruction_Memory_tb;

    reg [31:0] addr;    // Input address signal
    wire [31:0] inst;   // Output instruction signal
    
    // Instantiate the Instruction_Memory module
    Instruction_Memory uut (
        .addr(addr),
        .inst(inst)
    );
    
    // Initialize signals and create the stimulus
    initial begin
        // Initialize address to 0
        $dumpfile("instruction_memory_tb.vcd");   // Name of the VCD file
        $dumpvars(0, Instruction_Memory_tb);      // Dump all signals in this testbench module
	addr = 32'b0;
        
        // Apply test vectors (memory address range 0 to 110)
        #10 addr = 32'd0;    // Read from memory address 0
        #10 addr = 32'd4;    // Read from memory address 4
        #10 addr = 32'd8;    // Read from memory address 8
        #10 addr = 32'd12;   // Read from memory address 12
        #10 addr = 32'd16;   // Read from memory address 16
        #10 addr = 32'd20;   // Read from memory address 20
        #10 addr = 32'd24;   // Read from memory address 24
        #10 addr = 32'd28;   // Read from memory address 28
        #10 addr = 32'd32;   // Read from memory address 32
        #10 addr = 32'd36;   // Read from memory address 36
        #10 addr = 32'd40;   // Read from memory address 40
        #10 addr = 32'd44;   // Read from memory address 44
        #10 addr = 32'd48;   // Read from memory address 48
        #10 addr = 32'd52;   // Read from memory address 52
        #10 addr = 32'd56;   // Read from memory address 56
        #10 addr = 32'd60;   // Read from memory address 60
        #10 addr = 32'd64;   // Read from memory address 64
        #10 addr = 32'd68;   // Read from memory address 68
        #10 addr = 32'd72;   // Read from memory address 72
        #10 addr = 32'd76;   // Read from memory address 76
        #10 addr = 32'd80;   // Read from memory address 80
        #10 addr = 32'd84;   // Read from memory address 84
        #10 addr = 32'd86;   // Read from memory address 86
        #10 addr = 32'd90;   // Read from memory address 90
        #10 addr = 32'd94;   // Read from memory address 94
        #10 addr = 32'd98;   // Read from memory address 98
        #10 addr = 32'd102;  // Read from memory address 102
        #10 addr = 32'd106;  // Read from memory address 106
        #10 addr = 32'd110;  // Read from memory address 110

        // Finish simulation
        #10 $finish;
    end

    // Monitor the output instruction
    initial begin
        $monitor("At time %t, addr = %d, inst = %h", $time, addr, inst);
    end

endmodule

