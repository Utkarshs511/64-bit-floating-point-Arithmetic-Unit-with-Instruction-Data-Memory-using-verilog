`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 14:39:14
// Design Name: 
// Module Name: operation_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module operation_tb;
    reg enable;
    reg[63:0] A;
    reg[63:0] B;
	 reg[1:0] op;
	 wire [63:0] C;
	 
	operation uut1 (
        .enable(enable),
        .A(A),
        .B(B),
        .C(C),
		  .op(op)
    );
	 initial begin 
	 A=64'hDEAD;
	 B=64'hDEAD;
	 enable=0;
	 $display("Time\tA\tB\top\tC");
	 $monitor("%0t\t%b\t%h\t%h\t%b\t%h",$time,enable,A,B,op,C);
	 #10 enable=1;
	 #10;
	 #10 A=64'h4000000000000000;B=64'hBFE0000000000000; op=2'b00;//2,-0.5
	 #10 A=64'h4000000000000000;B=64'hBFE0000000000000; op=2'b01;//2,-0.5
	 #10 A=64'h40520147AE147AE1;B=64'h4046072B020C49BA; op=2'b10;//72.02,44.056
	 #10 A=64'h405B6AE147AE147B;B=64'h4037000000000000; op=2'b11;//109.67,23
	 #10 A=64'h410C1B9A39581062;B=64'hC11BF199D495182B; op=2'b00;//230259.278,-457830.4576
	 #10 A=64'h410C1B9A39581062;B=64'hC11BF199D495182B; op=2'b01;//230259.278,-457830.4576
	 #10 A=64'h410C1B9A39581062;B=64'hC11BF199D495182B; op=2'b10;//230259.278,-457830.4576
	 #10 A=64'hC0808B999999999A;B=64'hC0B1D83851EB851F; op=2'b00;//-529.45,-4568.22
	 #10 A=64'hC0808B999999999A;B=64'hC0B1D83851EB851F; op=2'b01;//-529.45,-4568.22
	 #10 A=64'hC0808B999999999A;B=64'hC0B1D83851EB851F; op=2'b11;//-529.45,-4568.22
	 
	 end
endmodule
