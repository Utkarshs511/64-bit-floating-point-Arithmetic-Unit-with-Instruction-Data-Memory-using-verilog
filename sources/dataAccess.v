`timescale 1ns / 1ps
module dataAccess(
	 input wire clk,
    input wire rst,
	 input wire stop,
	 input wire [15:0] inst,
	 output reg [63:0] A,
    output reg[63:0] B,
	 input wire [127:0] data_in,
	 output reg [1:0] op,
	 output reg  enable
	 
    );
	 reg [127:0] memory [0:191];
	 reg [127:0] data_out;
    wire [12:0] addr;
    wire rw;
	 assign addr = inst[15:3];
    assign rw   = inst[2];
	 initial begin
        $readmemh("datamem.mem", memory);
    end
	 always @(posedge clk or posedge rst) begin
        if (rst || stop) begin
            enable= 0;
				A=0;
				B=0;
				op=0;
        end 
		  else begin
            if (rw) begin
                memory[addr] = data_in;  
					  op=2'bX;
            end 
				else begin
					 data_out = memory[addr];
					 op=inst[1:0];
					 A=data_out[127:64];
					 B=data_out[63:0];
				    
                
            end
        end
    end


endmodule
