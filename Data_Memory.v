module Data_Memory(input WE,clk,
input [31:0]A,WD,
output [31:0]RD);

reg [31:0]data[0:63];

always@(posedge clk)begin

if(WE)
data[A]<= WD;

end

assign RD=data[A];

endmodule

module Data_Memory_tb();

reg WE,clk;
reg [31:0]A,WD;
wire [31:0]RD;

Data_Memory d1(.WE(WE),.clk(clk),.WD(WD),.A(A),.RD(RD));

always
#10 clk=~clk;

initial
begin

clk=1'b0; WE=1'b0; WD=32'd0; A=32'd0;

#10
$display("Test_1");
WE=1'b1;
A=32'd30;
WD=32'h08ABC;
#20
if((RD==32'h08ABC))
$display("pass_1");
else
$display("fail_1");

#10
$display("Test_2");
WE=1'b0;
A=32'd30;
WD=32'h09ABC;
#20
if(RD==32'h08ABC)
$display("pass_2");
else
$display("fail_2");

end

endmodule
