`timescale 1ns / 1ps
module top_module(
	 input clk,
	 input rst,
	 input wire [127:0] data_in,
	 output reg[63:0] C_out
    );
	 wire [7:0] pc_out;
	 wire [15:0] inst;
	 wire [63:0] A,B,C;
	 wire [1:0] op;
	 wire enable,stop;
	 programCounter u1(.clk(clk),.rst(rst),.pc_out(pc_out),.stop(stop));
	 instruction u2(.clk(clk),.rst(rst),.pc(pc_out),.inst(inst),.stop(stop));
	 dataAccess u3(.clk(clk),.rst(rst),.inst(inst),.data_in(data_in),.A(A),.B(B),.op(op),.enable(enable),.stop(stop));
	 operation u4(.A(A),.B(B),.op(op),.enable(enable),.C(C));
	 always @(*) begin
		C_out<=C;
	end
endmodule
