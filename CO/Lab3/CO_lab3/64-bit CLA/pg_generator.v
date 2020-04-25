module pg_generator( a, b, p, g);
/////*IO DEFINITION*////
    input [63:0] a, b;
    output [63:0] p, g;
/////////////////////////

//////*your design*//////
    assign p = a | b;
    assign g = a & b;
/////////////////////////
   
endmodule