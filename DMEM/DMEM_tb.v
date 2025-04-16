module Data_Memory_tb;

    // Declare inputs to the DUT (Device Under Test)
    reg clk;
    reg rst_n;
    reg MemRW;
    reg [31:0] addr;
    reg [31:0] DataW;
    
    // Declare output of the DUT
    wire [31:0] DataR;
    
    // Instantiate the Data_Memory module
    Data_Memory uut (
        .clk(clk),
        .rst_n(rst_n),
        .MemRW(MemRW),
        .addr(addr),
        .DataW(DataW),
        .DataR(DataR)
    );
    
    // Clock Generation
    always begin
        #5 clk = ~clk; // Clock with 10 time unit period
    end
    
    // Initializing the signals and applying test vectors
    initial begin
        // Create a VCD file for waveform output
        $dumpfile("data_memory_tb.vcd");   // Name of the VCD file
        $dumpvars(0, Data_Memory_tb);      // Dump all signals in this testbench module
        
        // Initialize signals
        clk = 0;
        rst_n = 0;
        MemRW = 0;
        addr = 32'b0;
        DataW = 32'b0;
        
        // Apply reset
        #10 rst_n = 1; // Release reset after 10 time units
        
        // Test 1: Write data to address 17 (initial value should be 56)
        #10 MemRW = 0; addr = 32'd17; DataW = 32'd100; // Write 100 to address 17
        #10 MemRW = 1; addr = 32'd17; // Read from address 17 (should be 100)
        
        // Test 2: Write data to address 15 (initial value should be 65)
        #10 MemRW = 0; addr = 32'd15; DataW = 32'd200; // Write 200 to address 15
        #10 MemRW = 1; addr = 32'd15; // Read from address 15 (should be 200)
        
        // Test 3: Write to other address (e.g., address 10)
        #10 MemRW = 0; addr = 32'd10; DataW = 32'd300; // Write 300 to address 10
        #10 MemRW = 1; addr = 32'd10; // Read from address 10 (should be 300)
        
        // Test 4: Reset the memory and check data
        #10 rst_n = 0; // Apply reset
        #10 rst_n = 1; // Release reset
        #10 MemRW = 1; addr = 32'd10; // Read from address 10 (should be 0 after reset)
        
        // Test 5: Write and read at different addresses
        #10 MemRW = 0; addr = 32'd5; DataW = 32'd555; // Write 555 to address 5
        #10 MemRW = 1; addr = 32'd5; // Read from address 5 (should be 555)
        
        #10 MemRW = 0; addr = 32'd8; DataW = 32'd888; // Write 888 to address 8
        #10 MemRW = 1; addr = 32'd8; // Read from address 8 (should be 888)
        
        // Finish simulation
        #10 $finish;
    end

    // Monitor the output values
    initial begin
        $monitor("Time = %t, MemRW = %b, Addr = %d, DataW = %d, DataR = %d", 
                 $time, MemRW, addr, DataW, DataR);
    end

endmodule

