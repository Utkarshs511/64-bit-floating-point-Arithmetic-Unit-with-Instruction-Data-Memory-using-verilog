`timescale 1ns / 1ps
module operation(
	 input enable,
    input [63:0] A,
    input [63:0] B,
	 input [1:0] op,
    output reg [63:0] C
    );
	 wire [63:0] add_out, sub_out, mul_out, div_out;
	 reg [63:0] b;
    
	 always @(*) begin
		   case (op)
            2'b01: b={~B[63],B[62:0]};
				default: b=B;
        endcase
    end
	 addition u1 (.A(A), .B(b), .C(add_out),.enable(enable));
    multiplication u2(.A(A), .B(b), .C(mul_out),.enable(enable));
    division u3 (.A(A), .B(b), .C(div_out),.enable(enable));
	 always @(*) begin
		  case (op)
            2'b00: C = add_out;
            2'b01: C = add_out;
            2'b10: C = mul_out;
            2'b11: C = div_out;
            default:C = 64'b0;
        endcase
	 end

endmodule
