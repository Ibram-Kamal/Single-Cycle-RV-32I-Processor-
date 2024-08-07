module Risc_V (
  input areset_cpu,areset_uart,clk,
  output tx
);
wire PCSrc,PCLoad;       //PC control
wire [2:0] ALUControl;   //ALU control
wire ALUSrc,ResultSrc;   //Muxes control signals
wire [1:0] SEControl;    //Sign_Extend control
wire WD,W,SF,ZF,Funct7;          
wire [6:0] OP;
wire [14:12] Funct3;
wire [31:0] out;

DataPath datapath (.areset(areset_cpu),.clk(clk_cpu),.PCSrc(PCSrc),.PCLoad(PCLoad),.ALUControl(ALUControl),.ALUSrc(ALUSrc),.ResultSrc(ResultSrc),.SEControl(SEControl),.WD(WD),.W(W),.SF(SF),.ZF(ZF),.OP(OP),.Funct3(Funct3),.Funct7(Funct7),.out(out));
Control_Unit controlunit (.SF(SF),.ZF(ZF),.OP(OP),.Funct3(Funct3),.Funct7(Funct7),.PCSrc(PCSrc),.PCLoad(PCLoad),.ALUControl(ALUControl),.ALUSrc(ALUSrc),.ResultSrc(ResultSrc),.SEControl(SEControl),.WD(WD),.W(W));
//uart transmitter (.clk(clk),.areset(areset),.en(WD),.in(out[7:0]),.tx(tx));
UartplusBuffer transmitter (.clk_cpu(clk_uart),.clk_uart(clk_uart),.areset_cpu(areset_cpu),.areset_uart(areset_uart),.WD(WD),.data(out[7:0]),.tx_serial(tx));

PLL pll (
	clk,
	clk_uart,
	clk_cpu);
endmodule
