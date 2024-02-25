
module PC_counter(input [31:0]ImmExt,
input areset,load,clk,PCSrc,
output reg [31:0]PC);
reg [31:0]PCNext;
always@(posedge clk, negedge areset)begin

if(!areset)
PC<=0;
else 
if(load)
PC<=PCNext;
end

always@(*)begin
if(PCSrc)
PCNext=PC+ImmExt;
else
PCNext=PC+4;
end


endmodule

