`timescale 1ns / 1ps
module instruction(
	 input clk,
	 input wire rst,
	 input wire stop,
    input wire [7:0] pc, 
    output reg [15:0] inst
    );
	 reg [7:0] mem [0:8000];  
    initial begin
        $readmemh("instructionQueue.mem", mem);
    end

    always @(posedge clk) begin
		  if (stop)
				inst<=16'h0000; 
        else if (!rst)
            inst <= mem[pc];
        else
            inst <= 16'h0000;
    end

endmodule
