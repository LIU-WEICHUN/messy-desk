`include "sum_generator.v"
`include "carry_generator.v"
`include "pg_generator.v"
`include "gPG_generator.v"

module carry_generator_16bit(p, g, cin, cout);
	input [15:0] p, g;
	input [3:0] cin;
	output [15:1] cout;
	carry_generator carry1(p[3:0], g[3:0], cin[0], cout[3:1]);//c1,c2,c3
	carry_generator carry2(p[7:4], g[7:4], cin[1], cout[7:5]);//c5,c6,c7
	carry_generator carry3(p[11:8], g[11:8], cin[2], cout[11:9]);//c9,c10,c11
	carry_generator carry4(p[15:12], g[15:12], cin[3], cout[15:13]);//c13,c14,c15
endmodule

module gPG_generator_4bit(p, g, gG, gP);
	input [15:0] p, g; 
	output [3:0] gG, gP;
	gPG_generator PG1( p[3:0], g[3:0], gG[0], gP[0]);
	gPG_generator PG2( p[7:4], g[7:4], gG[1], gP[1]);
	gPG_generator PG3( p[11:8], g[11:8], gG[2], gP[2]);
	gPG_generator PG4( p[15:12], g[15:12], gG[3], gP[3]);
endmodule


module cla_64bit( a, b, cin, sum);

	input [63:0] a, b;
	input cin;
	output [63:0] sum;

	wire [3:0] gG, gP;
	wire [15:0] G, P;
	wire [63:0] p, g;
	wire [63:1] c; 
	
//////*your design*//////
	pg_generator pg( a[63:0], b[63:0], p[63:0], g[63:0]);


	gPG_generator_4bit PG1( p[15:0], g[15:0], G[3:0], P[3:0]);
	gPG_generator_4bit PG2( p[31:16], g[31:16], G[7:4], P[7:4]);
	gPG_generator_4bit PG3( p[47:32], g[47:32], G[11:8], P[11:8]);
	gPG_generator_4bit PG4( p[63:48], g[63:48], G[15:12], P[15:12]);

	gPG_generator PGlevel2_1( P[3:0], G[3:0], gG[0], gP[0]);
	gPG_generator PGlevel2_2( P[7:4], G[7:4], gG[1], gP[1]);
	gPG_generator PGlevel2_3( P[11:8], G[11:8], gG[2], gP[2]);
	gPG_generator PGlevel2_4( P[15:12], G[15:12], gG[3], gP[3]);

	carry_generator carry_c16x4(gP[3:0], gG[3:0], cin, {c[48], c[32], c[16]});

	carry_generator carry1(P[3:0], G[3:0], cin, {c[12], c[8], c[4]});
	carry_generator carry2(P[7:4], G[7:4], c[16], {c[28], c[24], c[20]});
	carry_generator carry3(P[11:8], G[11:8], c[32], {c[44], c[40], c[36]});
	carry_generator carry4(P[15:12], G[15:12], c[48], {c[60], c[56], c[52]});

	carry_generator_16bit carryL2_1( p[15:0], g[15:0], {c[12], c[8], c[4], cin}, c[15:1]);
	carry_generator_16bit carry_L2_2( p[31:16], g[31:16], {c[28], c[24], c[20], c[16]}, c[31:17]);
	carry_generator_16bit carryL2_3( p[47:32], g[47:32], {c[44], c[40], c[36], c[32]}, c[47:33]);
	carry_generator_16bit carryL2_4( p[63:48], g[63:48], {c[60], c[56], c[52], c[48]}, c[63:49]);

	sum_generator_64 answer(a[63:0], b[63:0], cin, c[63:1], sum[63:0]);
/////////////////////////
	
endmodule


