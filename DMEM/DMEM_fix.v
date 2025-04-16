module Data_Memory(
    input clk,                // Clock input
    input rst_n,              // Active low reset
    input MemRW,              // Memory Read/Write signal
    input [31:0] addr,        // Address input
    input [31:0] DataW,       // Data to write
    output reg [31:0] DataR   // Data to read
);

    integer k;
    reg [31:0] D_Mem [63:0]; // Memory array with 64 locations

    always @(posedge clk) begin
        // Initialization of some memory locations
        D_Mem[17] <= 56;
        D_Mem[15] <= 65;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset the memory to zero
            for (k = 0; k < 64; k = k + 1) begin
                D_Mem[k] <= 32'b00;
            end
        end else if (!MemRW) begin
            // Write operation (MemRW = 0)
            D_Mem[addr] <= DataW;
        end
    end

    always @(*) begin
        // Read operation (MemRW = 1)
        if (MemRW) begin
            DataR = D_Mem[addr];
        end
        else begin
            DataR = 32'b0;  // Default value when not reading
        end
    end

endmodule

