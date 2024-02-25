module Register_File(
input [31:0] data,
input [4:0] read_add_A,read_add_B,write_add,
input write_en,clk,clear,
output [31:0] read_data_A,read_data_B);
reg [31:0]RF[0:31];
integer i;
always@(posedge clk, negedge clear)
begin

if((!clear))
for(i=0;i<32;i=i+1)
RF[i]<=0;

else if(write_en)
RF[write_add]<=data;

end
assign read_data_A=RF[read_add_A];
assign read_data_B=RF[read_add_B];

endmodule
