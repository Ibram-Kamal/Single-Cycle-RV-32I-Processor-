module testbench;

reg areset, clk1, clk10;
wire tx;

//System UUT (.clk_riscv(clk1),.clk_uart(clk10),.areset_riscv(areset),.areset_uart(areset),.tx(tx));
Risc_V UUT (.areset_cpu(areset),.areset_uart(areset),.clk_cpu(clk1),.clk_uart(clk10),.tx(tx));

always
#5 clk10 = ~clk10;

always
#50 clk1 = ~clk1;

initial
begin
clk1 = 1'b0;
clk10 = 1'b0;
areset = 1'b0;
#100
areset = 1'b1;
end

endmodule
