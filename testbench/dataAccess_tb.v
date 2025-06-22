module dataAccess_tb;
	 reg clk;
	 reg rst;
	 reg stop;
	 reg [15:0] inst;
	 reg [127:0] data_in;
	 wire enable;
    wire[63:0] A;
    wire[63:0] B;
	 wire[1:0] op;
	
	 
	dataAccess uut1(
			.clk(clk),
			.rst(rst),
			.stop(stop),
			.inst(inst),
			.A(A),
			.B(B),
			.data_in(data_in),
			.op(op),
			.enable(enable)
	);
	always #5 clk = ~clk;
	 initial begin 
	 clk= 0;
    rst= 1;
    stop=0;
    inst=0;
    data_in=0;
	 
    #10;
    rst=0;
	 
	  inst={13'd26, 1'b1, 2'b10}; 
    data_in={64'hAAAABBBBCCCCDDDD, 64'h1111222233334444}; 
    #10;
	 inst={13'd10, 1'b0, 2'b10};
    #10;
	 $display("A = %h", A);
    $display("B = %h", B);
    $display("op = %b", op);
    $display("enable = %b", enable);
	 

	 inst={13'd26, 1'b0, 2'b10}; 
    #10;

    $display("After reading from memory address 26:");
	 
    $display("A = %h", A);
    $display("B = %h", B);
    $display("op = %b", op);
    $display("enable = %b", enable);
	
    $finish;
  end

endmodule
