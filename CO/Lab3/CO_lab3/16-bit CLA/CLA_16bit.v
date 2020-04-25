`include "pg_generator.v"
`include "sum_generator.v"
`include "gPG_generator.v"
`include "carry_generator.v"

module cla_16bit( a, b, cin, sum);

	input [15:0] a, b;
	input cin;
	output [15:0] sum;
	
	wire [3:0] gG, gP;
	wire [15:0] p, g;
	wire [16:0] c;
		
	//generate p & g
	pg_generator pg( a[15:0], b[15:0], p[15:0], g[15:0]);
	
	//generate group g & p 
	gPG_generator PG1( p[3:0], g[3:0], gG[0], gP[0]);
	gPG_generator PG2( p[7:4], g[7:4], gG[1], gP[1]);
	gPG_generator PG3( p[11:8], g[11:8], gG[2], gP[2]);
	gPG_generator PG4( p[15:12], g[15:12], gG[3], gP[3]);
	
	//generate c4, c8 & c12
	carry_generator carry_c4x1(gP[3:0], gG[3:0], cin, {c[12], c[8], c[4]});//c4,c8,c12

	//generate carry
	carry_generator carry1(p[3:0], g[3:0], cin, c[3:1]);//c1,c2,c3
	carry_generator carry2(p[7:4], g[7:4], c[4], c[7:5]);//c5,c6,c7
	carry_generator carry3(p[11:8], g[11:8], c[8], c[11:9]);//c9,c10,c11
	carry_generator carry4(p[15:12], g[15:12], c[12], c[15:13]);//c13,c14,c15
	
	//generate sum
	sum_generator sum1( a[15:0], b[15:0], cin, c[15:1], sum[15:0]);
	
endmodule
