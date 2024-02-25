module MainDecoder(input [6:0]op,
output reg RegWrite,ALUSrc,MemWrite,ResultSrc,Branch,
output reg [1:0]ImmSrc,ALUOP);
always@(*)begin
case(op)
7'b000_0011:begin
	RegWrite=1'b1;
	ImmSrc=2'b00;
	ALUSrc=1'b1;
	MemWrite=1'b0;
	ResultSrc=1'b1;
	Branch=1'b0;
	ALUOP=2'b00;
	end
7'b010_0011:begin
	RegWrite=1'b0;
	ImmSrc=2'b01;
	ALUSrc=1'b1;
	MemWrite=1'b1;
	ResultSrc=1'bx;
	Branch=1'b0;
	ALUOP=2'b00;
	end
7'b011_0011:begin
	RegWrite=1'b1;
	ImmSrc=2'bxx;
	ALUSrc=1'b0;
	MemWrite=1'b0;
	ResultSrc=1'b0;
	Branch=1'b0;
	ALUOP=2'b10;
	end
7'b001_0011:begin
	RegWrite=1'b1;
	ImmSrc=2'b00;
	ALUSrc=1'b1;
	MemWrite=1'b0;
	ResultSrc=1'b0;
	Branch=1'b0;
	ALUOP=2'b10;
	end
7'b110_0011:begin
	RegWrite=1'b0;
	ImmSrc=2'b10;
	ALUSrc=1'b0;
	MemWrite=1'b0;
	ResultSrc=1'bx;
	Branch=1'b1;
	ALUOP=2'b01;
	end
default:begin
	RegWrite=1'b0;
	ImmSrc=2'b00;
	ALUSrc=1'b0;
	MemWrite=1'b0;
	ResultSrc=1'b0;
	Branch=1'b0;
	ALUOP=2'b00;
	end
endcase

end
endmodule


