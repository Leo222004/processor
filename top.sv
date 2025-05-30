`timescale 1ns / 1ps
module top
(
    input  logic        sel_fpga,
    input  logic        clock,
    input  logic        en_fpga,
    input  logic        rst_n,
    output logic [2:0]  pc,
    output logic [1:0]  flags,
    output logic [3:0]  result
);
logic [31:0]    counter_32b_out;
logic [2:0]     counter_3b_out;
logic [15:0]    rom_out;
logic [3:0]     alu_out;
logic [3:0]     ram_out1;
logic [3:0]     ram_out2;
logic           carry_flag_out;
logic           zero_flag_out;
counter
#(
    .SIZE(32)
) counter_32b
(
    .clock(clock),
    .rst_n(rst_n),
    .en   (en_fpga),
    .out  (counter_32b_out)
);
counter
#(
    .SIZE(3)
) counter_3b
(
    .clock((sel_fpga==0)?clock:counter_32b_out[26]),
    .rst_n(rst_n),
    .en   (1),
    .out  (counter_3b_out)
);
assign pc=counter_3b_out;
rom rom_1
(
    .addr(counter_3b_out),
    .out (rom_out)
);
ram ram_1
(
    .clock ((sel_fpga==0)?clock:counter_32b_out[26]),
    .w_en  (|rom_out[15:12]),
    .raddr1(rom_out[3:0]),
    .raddr2(rom_out[7:4]),
    .waddr (rom_out[11:8]),
    .wdata (alu_out),
    .rdata1(ram_out1),
    .rdata2(ram_out2)
);
alu alu_1
(
    .opcode    (rom_out[14:12]),
    .operand1  ((rom_out[15]==0)?ram_out1:rom_out[3:0]),
    .operand2  (ram_out2),
    .carry_flag(carry_flag_out),
    .zero_flag (zero_flag_out),
    .result    (alu_out)
);
register_2b register_2b_1
(
    .clock((sel_fpga==0)?clock:counter_32b_out[26]),
    .in   ({carry_flag_out,zero_flag_out}),
    .rst_n(rst_n),
    .out  (flags) 
); 
assign result=alu_out;
endmodule
