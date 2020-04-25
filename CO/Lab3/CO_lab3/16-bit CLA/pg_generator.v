module pg_generator( a, b, p, g);

        input [15:0] a, b;
        output [15:0] p, g;

        // Carry Propagate
        assign p = a | b;	//p = a + b
        assign g = a & b ;	//g = a * b
    
endmodule