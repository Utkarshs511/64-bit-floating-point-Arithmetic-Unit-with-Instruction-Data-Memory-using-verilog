`timescale 1ns / 1ps
module addition(
	 input enable,
    input[63:0] A,
    input[63:0]B,
	 output reg [63:0] C
    );
	 reg[53:0] sum;
	 reg [52:0] am;
	 reg [52:0] bm;
	 reg [52:0] a;
	 reg [52:0] b;
	 reg [10:0] max;
    reg signed [10:0] shift;
	 reg sign;
	 reg op;
	 integer i;
	 always@(*)begin
	
	 am={1'b1,A[51:0]};
	 bm={1'b1,B[51:0]};
	 shift=(A[62:52]>B[62:52])?(A[62:52]-B[62:52]):(B[62:52]-A[62:52]);
	 max=(A[62:52]>B[62:52])?A[62:52]:B[62:52];
	 op=A[63]^B[63];
	 if (A[62:52]>B[62:52]) 
		bm = bm >> shift; 
    else 
		am = am >> shift;
	 if(am>bm)begin
		a=am;
		b=bm;
		sign = A[63];
	 end
	 else begin
		a=bm;
		b=am;
		sign = B[63];
	 end
	 if(op) begin
		sum=a-b;
	 end
	 else begin
		sum=am+bm;
	 end
	 if (sum[53]) begin
                sum = sum >> 1;
                max = max+ 1;
            end else begin
                for (i = 0; i < 53 && sum[52] != 1; i = i + 1) begin
    sum = sum << 1; 
    max = max - 1;  
end
            end
	 C={sign,max,sum[51:0]};
end

endmodule
