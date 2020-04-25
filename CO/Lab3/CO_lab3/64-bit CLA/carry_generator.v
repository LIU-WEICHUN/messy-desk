module carry_generator( p, g, cin, c);
/////*IO DEFINITION*////
	input [3:0] p, g;
	input cin;
	output [3:1] c;
/////////////////////////

//////*your design*//////
	assign c[1] = g[0]|(p[0] & cin);
	assign c[2] = g[1]|(p[1] & g[0])|(p[1] & p[0] & cin);
	assign c[3] = g[2]|(p[2] & g[1])|(p[2] & p[1] & g[0])|(p[2] & p[1] & p[0] & cin);
/////////////////////////
		
endmodule