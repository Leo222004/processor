# Minimal Processor Implementation in Verilog

This project represents the implementation of a minimal processor using Verilog HDL.

## Description

The processor is designed as a combinational and sequential digital circuit and includes the following key components:

- **counter_32b**: 32-bit asynchronous reset counter, with adjustable clock period depending on the `sel_fpga` signal.
- **counter_3b**: 3-bit asynchronous reset counter.
- **mux2_1b / mux2_4b**: 2-input multiplexers (1-bit and 4-bit wide).
- **ALU**: Arithmetic Logic Unit supporting various operations based on an `opcode`. It provides `carry` and `zero` flags.
- **ROM**: Read-only memory used for storing instructions.
- **RAM**: Multi-port RAM allowing asynchronous reads from two locations and synchronous writes.
- **register_2b**: 2-bit register with synchronous reset.

All modules are integrated into a top-level `processor` module.

## Simulation

The simulation is performed using a testbench that verifies the functionality of the entire processor. The design is tested for 10 clock cycles after the reset signal is released.

## FPGA Implementation

The project is designed to be implemented on an FPGA board, using the following pin mapping:

| Signal     | Pin   | Description              |
|------------|-------|--------------------------|
| `clk`      | F14   | 100MHz Clock             |
| `rst_n`    | V2    | Reset (SW0)              |
| `sel_fpga` | U2    | Clock selection (SW1)    |
| `en_fpga`  | U1    | Enable (SW2)             |
| `result[3:0]` | F2, F1, G2, G1 | Output LEDs   |
| `flags[1:0]`  | E5, E3        | Flags on LEDs |
| `pc[2:0]`     | A4, B4, A3    | Program Counter LEDs |


![image](https://github.com/user-attachments/assets/d0d68908-4d40-432b-b60d-10d97e64bd97)
