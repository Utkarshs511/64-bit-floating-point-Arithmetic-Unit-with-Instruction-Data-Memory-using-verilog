`timescale 1ns / 1ps
module multiplication(
    input [63:0] A,
    input [63:0] B,
    output reg [63:0] C,
    input enable
    );
	 reg [105:0] pro;
	 reg [52:0] am;
	 reg [52:0] bm;
	 reg [11:0] expA;
	 reg [11:0] expB;
	 reg [11:0] expC;
	 integer shift_amt;
	 reg sign;
	  
	 always@(*)begin
	 sign = A[63] ^ B[63];
	 am={1'b1,A[51:0]};
	 bm={1'b1,B[51:0]};
	 pro=106'b0;
	 expA={1'b0,A[62:52]};
	 expB={1'b0,B[62:52]};
	 if (A[62:0] == 0 || B[62:0] == 0) begin
            C = 64'b0; 
    end
	 else if (expA == 11'b11111111111 || expB == 11'b11111111111) begin
            if (A[51:0] != 0 || B[51:0] != 0) begin
                C = {A[63] ^ B[63], 11'b11111111111, 52'b1};
            end
				else begin
                C = {A[63] ^ B[63], 11'b11111111111, 52'b0};
				end
    end
	 else begin
	 pro=am*bm;
	 expC = expA + expB - 1023;
	 if (pro[105] == 1'b1) begin
                expC = expC+1; // If carry occurs
               
		end 
	 else begin
			  pro = pro << 1;
           
   end	
	end
	if (expC >= 2047) begin
                C = {sign, 11'b11111111111, 52'b0};  // Overflow (Infinity)
            end
            else if (expC <= 0) begin
                C = 64'b0;  
            end
            else begin
                C = {sign, expC[10:0], pro[104:53]};
            end
	end
	
endmodule
