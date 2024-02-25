module TOP_module_risc_v (input clk,load,clear,areset);

wire [31:0]C;
wire ZF,CF,SF;

wire [1:0]ALUOP;
wire [2:0]ALUcontrol;

wire [31:0] read_data_A,read_data_B;

wire [1:0]ImmSrc;
wire [31:0]ImmExt;

wire PCSrc;
wire [31:0]PC;

wire [31:0]out_mux1; //for data memory
wire [31:0]out_mux2;// for Alu

wire [31:0]RD;

wire [31:0]RD_Data;

wire RegWrite,ALUSrc,MemWrite,ResultSrc,Branch;


ALU TOP_ALU(.A(read_data_A),.B(out_mux2),.C(C),.sel(ALUcontrol),.ZF(ZF),.CF(CF),.SF(SF));


ALUDecoder TOP_ALUDecoder(.funct3(RD[14:12]),.funct7(RD[30]),.op5(RD[5]),.ALUOP(ALUOP),.ALUcontrol(ALUcontrol));


Register_File TOP_Register_File(.data(out_mux1),.read_add_A(RD[19:15]),.read_add_B(RD[24:20]),.write_add(RD[11:7]),.write_en(RegWrite),.clk(clk),.clear(clear),.read_data_A(read_data_A),.read_data_B(read_data_B));


SignExtend TOP_SignExtend(.ImmSrc(ImmSrc),.Instr(RD[31:7]),.ImmExt(ImmExt));


PC_counter TOP_PC_counter(.ImmExt(ImmExt),.areset(areset),.load(load),.clk(clk),.PCSrc(PCSrc),.PC(PC));


MUX TOP_MUX1(.A(C),.B(RD_Data),.C(out_mux1),.sel(ResultSrc));


MUX TOP_MUX2(.A(read_data_B),.B(ImmExt),.C(out_mux2),.sel(ALUSrc));


PCSrc TOP_PCSrc(.funct3(RD[14:12]),.ZF(ZF),.SF(SF),.Branch(Branch),.PCSrc(PCSrc));


Inst_Memory TOP_Inst_Memory(.A(PC),.RD(RD));


Data_Memory TOP_Data_Memory(.A(C),.clk(clk),.WE(MemWrite),.WD(read_data_B),.RD(RD_Data));


MainDecoder TOP_MainDecoder(.op(RD[6:0]),.RegWrite(RegWrite),.ALUSrc(ALUSrc),.MemWrite(MemWrite),.ResultSrc(ResultSrc),.Branch(Branch),.ImmSrc(ImmSrc),.ALUOP(ALUOP));

endmodule
