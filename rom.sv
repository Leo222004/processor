`timescale 1ns / 1ps
module rom
(
    input  logic [2:0]  addr,
    output logic [15:0] out
);
always_comb
    begin
        case(addr)
            0: out=16'h9005;
            1: out=16'h910A;
            2: out=16'h5201;
            3: out=16'h3301;
            4: out=16'h4401;
            5: out=16'h1703;
            6: out=16'h1804;
            7: out=16'h7F78;
            default: out=0;
        endcase
    end
endmodule
