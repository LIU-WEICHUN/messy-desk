`timescale 1ns/1ps
`include "block.v"

module tb_blk;

reg clk;
reg [2:0] in;
wire [2:0] blk, nblk;

blocking test(clk, in, blk, nblk);

always #5 clk = ~clk;

initial begin

	$dumpfile("blocking.vcd");  // gtkwave
	$dumpvars;	
	
	clk = 0;
	in = 5;
	
	#100 $finish;

end

endmodule