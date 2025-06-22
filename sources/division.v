`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 14:24:48
// Design Name: 
// Module Name: division
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


module division(
	 input [63:0] A,
    input [63:0] B,
    output reg [63:0] C,
    input enable
    );
	 reg [53:0] q;
	 reg [53:0] dd;
	 reg [52:0] bm;
	 reg [52:0] qm;
	 reg [10:0] expA;
	 reg [10:0] expB;
	 reg [10:0] expC;
	 integer i;
	 reg sign;
	  
	 always@(*)begin
	 
	 sign = A[63] ^ B[63];
	 bm={1'b1,B[51:0]};
	 expA=A[62:52];
	 expB=B[62:52];
	 q=54'b0;
	 if (A[62:0] == 0) begin
            C = 64'b0; 
    end
	 else if (B[62:0] == 0) begin
            C ={sign, 11'b11111111111, 52'b0}; 
    end
	 else begin 
			dd={2'b01,A[51:0]};
			for(i=53;i>=0;i=i-1) begin
				 q=q<<1;
				 if (dd >= bm) begin
                    q[0] = 1'b1;
                    dd = dd - bm;
                end 
					 dd=dd<<1;
			end
   end	
	if (q[53]) begin
               qm = q[53:1];
                expC = expA - expB + 1023;
            end 
	else begin
                qm = q[52:0];
                expC = expA - expB + 1022;
            end
	if (expC >= 2047) begin
                C = {sign, 11'b11111111111, 52'b0};  
            end
   else if (expC <= 0) begin
                C = 64'b0;  
            end
   else begin
                C = {sign, expC[10:0],qm[51:0]};
            end
end
endmodule

