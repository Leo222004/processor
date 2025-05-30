`timescale 1ns / 1ps
module counter
#(
    parameter SIZE=32
)
(
    input  logic            clock,
    input  logic            rst_n,
    input  logic            en,
    output logic [SIZE-1:0] out
);
always_ff @(posedge clock or negedge rst_n)
    begin
        if(rst_n==0)        out<=0;
        else if(en==1)      out<=out+1;
    end
endmodule
