module top_module_tb;
	reg clk;
	reg rst;
	reg [127:0] data_in;
	wire[63:0] C_out;
	wire [7:0] pc;
   wire [15:0] inst;
   wire [63:0] A, B, C;
   wire [1:0] op;
   wire enable;
   wire stop;

	top_module uut(
	.clk(clk),
	.rst(rst),
	.data_in(data_in),
	.C_out(C_out)
	);
	assign pc=uut.u1.pc_out;
   assign inst=uut.u2.inst;
   assign stop=uut.u1.stop;
   assign A=uut.u3.A;
   assign B=uut.u3.B;
   assign op=uut.u3.op;
   assign enable=uut.u3.enable;
   assign C=uut.u4.C;

	always #20 clk = ~clk;
	initial begin 
	clk=0;
   rst=1;
	
   #10;
   rst=0;
	$display("Time\trst\tpc\tinst\tstop\ten\tA\t\tB\t\tC\t\tC_out\t\t r/w");
        $monitor("%0dns\t%b\t%0d\t%h\t%b\t%b\t%h\t%h\t%h\t%h\t%b", 
                 $time, rst, pc, inst, stop, enable, A, B, C, C_out,inst[2]);
	end
endmodule
