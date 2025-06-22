module instruction_tb;
	 reg clk;
	 reg rst;
	 reg stop;
	 reg [7:0] pc;
	 wire [15:0] inst;
	 
	 instruction uut (
			.clk(clk),
			.rst(rst),
			.stop(stop),
			.pc(pc),
			.inst(inst)
	 );
	 always #5 clk = ~clk;
	 initial begin 
	 clk = 0;
    rst = 1;
    stop = 0;
	 pc=0;
	 
    #10;
    rst = 0;
	 
	 repeat (25) begin
            #10;
            $display("Time: %0t | PC: %0d | Instruction: %h", $time, pc, inst);
            pc = pc + 1;
    end
	 stop = 1;
    #10;
    $display("Time: %0t | PC: %0d | Instruction on stop: %h", $time, pc, inst);
    
	 end
endmodule
