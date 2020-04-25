module gPG_generator( p, g, gG, gP);

	input [3:0] p, g;
	output gG, gP;

	assign gG = (g[0] & p[1] & p[2] & p[3])|(g[1]&p[2]&p[3])|(g[2]&p[3])|g[3];
	assign gP = p[0] & p[1] & p[2] & p[3];
	
endmodule
