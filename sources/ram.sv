`timescale 1ns / 1ps
module ram
(
    input  logic        clock,
    input  logic        w_en,
    input  logic [3:0]  raddr1,
    input  logic [3:0]  raddr2,
    input  logic [3:0]  waddr,
    input  logic [3:0]  wdata,
    output logic [3:0]  rdata1,
    output logic [3:0]  rdata2
);
logic [3:0] memory[0:15];
always_ff @(posedge clock)
    begin
        if(w_en==1) memory[waddr] <= wdata;
    end
assign rdata1=memory[raddr1];
assign rdata2=memory[raddr2];
endmodule
