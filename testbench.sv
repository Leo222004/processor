`timescale 1ns / 1ps
module testbench();
logic        sel_fpga;
logic        clock;  
logic        en_fpga;
logic        rst_n;  
logic [2:0]  pc;     
logic [1:0]  flags;  
logic [3:0]  result;  
top dut
(
    .sel_fpga(sel_fpga),
    .clock   (clock   ),
    .en_fpga (en_fpga ),
    .rst_n   (rst_n   ),
    .pc      (pc      ),
    .flags   (flags   ),
    .result  (result  )
);
initial
    begin
        clock=0;
        forever #5 clock=~clock;
    end
initial
    begin
        repeat(2) @(posedge clock);
        #2;
        rst_n=0;
        sel_fpga=0;
        en_fpga=1;
        @(posedge clock);
        #2;
        rst_n=1;
        repeat(10) @(posedge clock);
        $stop();
    end

endmodule
