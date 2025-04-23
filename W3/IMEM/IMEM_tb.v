`timescale 1ns / 1ps

module Instruction_Memory_tb;

    // Declare registers and wires
    reg [31:0] addr;      // Address input to Instruction Memory
    wire [31:0] inst;     // Instruction output from Instruction Memory
    reg [31:0] expected_inst; // To store expected instruction for checking

    // Instantiate the Instruction_Memory module
    Instruction_Memory #(60) uut (
        .addr(addr),
        .inst(inst)
    );

    // Initialize memory and test setup
    initial begin

	//Create .vcd file to see waveform
	$dumpfile("IMEM.vcd");
	$dumpvars(0,Instruction_Memory_tb);	


        // Display headers
        $display("Time\tAddr\tInstruction\tExpected Instruction\tPass/Fail");

        // Load the test program
        $readmemb("test.prog", uut.memory, 0, 59);  // Read machine code from test.prog

        // Test each address in the array
        addr = 0;  // Start with the first address
        #10;
        check_instruction(0);

        addr = 1;  // Address 1
        #10;
        check_instruction(1);

        addr = 2;  // Address 2
        #10;
        check_instruction(2);

        addr = 3;  // Address 3
        #10;
        check_instruction(3);

        addr = 4;  // Address 4
        #10;
        check_instruction(4);

        // Finish test
        $finish;
    end

    // Procedure to compare actual output to expected instruction
    task check_instruction(input [31:0] address);
        begin
            // Retrieve the expected instruction from test.prog (machine code)
            case(address)
                0: expected_inst = 32'b00000000000000000101000010010011;  // li x10, 0
                1: expected_inst = 32'b00000000000000000101100010010011;  // li x11, 0
                2: expected_inst = 32'b00000000000001011000001101100011;  // bge x11, x0, done
                3: expected_inst = 32'b00000000001001011001011010010011;  // slli x12, x11, 2
                4: expected_inst = 32'b00000000110001000000111010110011;  // add x13, x8, x12
                // Add more expected values as needed
                default: expected_inst = 32'b0;
            endcase

            // Display the results
            $display("%0dns\t%0d\t%h\t%h\t%s", $time, addr, inst, expected_inst, (inst == expected_inst) ? "Pass" : "Fail");
        end
    endtask

endmodule

