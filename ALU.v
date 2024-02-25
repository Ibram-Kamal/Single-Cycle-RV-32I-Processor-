module ALU( input [31:0]A,
input [31:0]B,
input [2:0]sel,
output reg[31:0]C,
output reg CF,
output SF,ZF);

always@(*)begin

CF=1'b0;
  case(sel)
    
    3'b000:{CF,C}=A+B;
    3'b001:{CF,C}=A<<B;
    
    3'b010:{CF,C}=A-B;
    3'b100:C=A^B;
    3'b101:begin C=A>>B; 
                 CF=A>>(B-1);
                 end
    3'b110:C=A|B;
    3'b111:C=A&B;
    default:C=32'b0;

  endcase

end
assign ZF=~(|C);
assign SF=C[31];
endmodule



