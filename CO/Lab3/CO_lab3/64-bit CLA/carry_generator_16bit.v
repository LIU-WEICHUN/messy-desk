module carry_generator_16bit(p, g, cin, cout);
	input [15:0] p, g;
	input [3:0] cin;
	output [15:1] cout;
	carry_generator carry1(p[3:0], g[3:0], cin[0], cout[3:1]);//c1,c2,c3
	carry_generator carry2(p[7:4], g[7:4], cin[1], cout[7:5]);//c5,c6,c7
	carry_generator carry3(p[11:8], g[11:8], cin[2], cout[11:9]);//c9,c10,c11
	carry_generator carry4(p[15:12], g[15:12], cin[3], cout[15:13]);//c13,c14,c15
endmodule
