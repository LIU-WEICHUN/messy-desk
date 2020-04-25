module sum_generator_64( a, b, cin, c, sum);
/////*IO DEFINITION*////
	input [63:0] a, b;
	input cin;
	input [63:1] c;
	output [63:0] sum;
/////////////////////////

//////*your design*//////
	assign sum = a ^ b ^ {c,cin};
/////////////////////////
		
endmodule