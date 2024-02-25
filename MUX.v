module MUX(input sel,
input [31:0]A,B,
output reg [31:0]C);

always@(*)begin
if(sel)
C=B;
else
C=A;
end

endmodule
