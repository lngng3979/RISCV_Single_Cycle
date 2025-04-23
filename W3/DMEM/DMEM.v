module Data_Memory(
 input clk,
 // address input, shared by read and write port
 input [31:0]   addr,
 
 // write port
 input [31:0]   DataW,
 input     MemRW,
 // read port
 output [31:0]   DataR
);

reg [31:0] Memory [255:0];
integer f;
wire [31:0] ram_addr=addr[31:0];
initial
 begin
  $readmemb("./test.data", Memory);
  
  f = $fopen("./test.o");
  $fmonitor(f, "time = %d\n", $time, 
  "\tmemory[0] = %b\n", Memory[0],   
  "\tmemory[1] = %b\n", Memory[1],
  "\tmemory[2] = %b\n", Memory[2],
  "\tmemory[3] = %b\n", Memory[3],
  "\tmemory[4] = %b\n", Memory[4],
  "\tmemory[5] = %b\n", Memory[5],
  "\tmemory[6] = %b\n", Memory[6],
  "\tmemory[7] = %b\n", Memory[7]);
  #320;
  $fclose(f);
 end
 
 always @(posedge clk) begin
  if (!MemRW)   //When MemRW =0 , we want to write data
   Memory[ram_addr] <= DataR;
 end
 assign DataR = (MemRW ==1'b1) ? Memory[ram_addr]: 32'd0; 

endmodule
