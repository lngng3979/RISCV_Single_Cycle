module Data_Memory_tb;

  // Declare signals for the testbench
  reg clk;
  reg [31:0] addr;
  reg [31:0] DataW;
  reg MemRW;
  wire [31:0] DataR;

  // Instantiate the Data_Memory module
  Data_Memory uut (
    .clk(clk),
    .addr(addr),
    .DataW(DataW),
    .MemRW(MemRW),
    .DataR(DataR)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;  // Toggle clock every 5 time units
  end

  // Initialize and monitor the test
  initial begin
    $dumpfile("DMEM.vcd");
    $dumpvars();
    // Initialize signals
    clk = 0;
    addr = 0;
    DataW = 0;
    MemRW = 0;

    // Monitor the DataR output
    $monitor("Time = %0t | addr = %h | DataW = %h | MemRW = %b | DataR = %h", $time, addr, DataW, MemRW, DataR);

    // Read machine code from 'test.data' into the memory
    $readmemb("./test.data", uut.Memory);  // Load memory from the test.data file

    // Wait for the memory initialization
    #10;

    // Write data to address 0
    MemRW = 0;  // Write operation
    addr = 0;
    DataW = 32'hABCDEF01;  // Data to write
    #10;  // Wait for 1 clock cycle

    // Read the data back from address 0
    MemRW = 1;  // Read operation
    addr = 0;
    #10;  // Wait for 1 clock cycle

    // Write data to address 1
    MemRW = 0;  // Write operation
    addr = 4;   // Address is incremented
    DataW = 32'h98765432;  // Data to write
    #10;  // Wait for 1 clock cycle

    // Read the data back from address 1
    MemRW = 1;  // Read operation
    addr = 4;
    #10;  // Wait for 1 clock cycle

    // Test case for reading from the memory after initialization
    MemRW = 1;  // Read operation
    addr = 0;   // Address 0 should contain the initial data
    #10;  // Wait for 1 clock cycle
    addr = 4;   // Address 4 should contain the data written earlier
    #10;  // Wait for 1 clock cycle

    // End of test
    $finish;
  end

endmodule

