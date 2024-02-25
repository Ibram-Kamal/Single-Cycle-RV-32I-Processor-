module PCSrc(input[2:0]funct3,
input ZF,SF,Branch,
output reg PCSrc);
always@(*)begin
case(funct3)
3'b000:PCSrc=Branch&ZF;
3'b001:PCSrc=Branch&(~ZF);
3'b100:PCSrc=Branch&SF;
default:PCSrc=Branch&ZF;
endcase
end
endmodule
