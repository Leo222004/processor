`timescale 1ns / 1ps
module alu
(
    input  logic [2:0]  opcode,
    input  logic [3:0]  operand1,
    input  logic [3:0]  operand2,
    output logic        carry_flag,
    output logic        zero_flag,
    output logic [3:0]  result
);
always_comb
    begin
        carry_flag=0;
        case(opcode)
            3'b000: result=0;
            3'b001: result=operand1;
            3'b010: result=~operand1;
            3'b011: {carry_flag,result}=operand2+operand1;
            3'b100: {carry_flag,result}=operand2-operand1;
            3'b101: result=operand2 & operand1;
            3'b110: result=operand2 | operand1;
            3'b111: result=operand2 ^ operand1;
        endcase
        if(result==0)   zero_flag=1;
        else            zero_flag=0;
    end
endmodule
