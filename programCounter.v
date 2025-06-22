`timescale 1ns / 1ps
module programCounter(
	 input wire clk,
    input wire rst,       
    output reg [7:0] pc_out,
	 output reg stop
    );
	 initial begin
		  pc_out=8'h0;
		  stop=0;
	 end
	 always @(posedge clk or posedge rst) begin
        if (rst)begin
            pc_out <= 8'h0;
				stop<=0;
		  end	
		  else if (pc_out==8'hFF)
				stop<=1;
        else 
            pc_out <= pc_out + 1;
    end

endmodule
