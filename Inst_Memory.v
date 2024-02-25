module Inst_Memory(input [31:0]A,
output [31:0]RD);
reg [31:0]Inst_Mem[0:63];

integer i;
initial begin
  for (i=0; i<=63; i=i+1)
    Inst_Mem[i] = 8'h00;
  $readmemh ("program.txt", Inst_Mem, 0, 20);
end
assign RD=Inst_Mem[A/4];
endmodule

