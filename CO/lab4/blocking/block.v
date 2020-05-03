module blocking(clk, in, blk, nblk);

input clk;
input [2:0] in;
output [2:0] blk, nblk;

reg [2:0] blk, nblk;
reg [2:0] blk_reg1, blk_reg2, blk_reg3;
reg [2:0] nblk_reg1, nblk_reg2, nblk_reg3;

always@(posedge clk)begin
	nblk_reg1 <= in;
	nblk_reg2 <= nblk_reg1;
	nblk_reg3 <= nblk_reg2;
	nblk <= nblk_reg3;
end

always@(posedge clk)begin
	blk_reg1 = in;
	blk_reg2 = blk_reg1;
	blk_reg3 = blk_reg2;
	blk  = blk_reg3;	
end

endmodule