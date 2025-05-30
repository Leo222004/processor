`timescale 1ns / 1ps
module register_2b
(
    input  logic        clock,
    input  logic [1:0]  in,
    input  logic        rst_n,
    output logic [1:0]  out
);
always_ff @(posedge clock)
    begin
        if(rst_n==0)    out<=0;
        else            out<=in;
    end
endmodule
