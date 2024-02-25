module ALUDecoder(input [2:0]funct3,
input funct7,op5,
input [1:0]ALUOP,
output reg [2:0]ALUcontrol);

always@(*)begin

case(ALUOP)

2'b00: ALUcontrol=3'b000;
2'b01:begin case(funct3) 
	3'b000:ALUcontrol=3'b010;
	3'b001:ALUcontrol=3'b010;
	3'b100:ALUcontrol=3'b010;
	default:ALUcontrol=3'b000;endcase end
2'b10:begin case(funct3)
	3'b000:begin if({op5,funct7}==2'b11)
		ALUcontrol=3'b010;
		else
		ALUcontrol=3'b000; end
	3'b001:ALUcontrol=3'b001;
	3'b100:ALUcontrol=3'b100;
	3'b101:ALUcontrol=3'b101;
	3'b110:ALUcontrol=3'b110;
	3'b111:ALUcontrol=3'b111;
	default:ALUcontrol=3'b000;
	endcase end
default:ALUcontrol=3'b000;

endcase

end
endmodule