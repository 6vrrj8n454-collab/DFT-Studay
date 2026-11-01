module tb;
  reg a, b, c;
  wire y_good, y_sa0, y_sa1;
  
  good_circuit u_good(.a(a), .b(b), .c(c), .y(y_good));
  fault_sa0 u_sa0(.a(a), .b(b), .c(c), .y(y_sa0));
  fault_sa1 u_sa1(.a(a), .b(b), .c(c), .y(y_sa1));
  
  initial begin
    $display("a b c | y_good | y_sa0 | y_sa1 | whtear view SA0? | whtear view SA1?");
    $display("---------------------------------------------------------");
    
    a=0; b=0; c=0; #10;
    $display("%b %b %b |   %b    |   %b   |   %b   |       %s       |       %s", a, b, c, y_good, y_sa0, y_sa1,
             (y_good != y_sa0) ? "yes" : "no",
             (y_good != y_sa1) ? "yes" : "no");
    
    a=0; b=0; c=1; #10;
    $display("%b %b %b |   %b    |   %b   |   %b   |       %s       |       %s", a, b, c, y_good, y_sa0, y_sa1,
             (y_good != y_sa0) ? "yes" : "no",
             (y_good != y_sa1) ? "yes" : "no");
    
    a=0; b=1; c=0; #10;
    $display("%b %b %b |   %b    |   %b   |   %b   |       %s       |       %s", a, b, c, y_good, y_sa0, y_sa1,
             (y_good != y_sa0) ? "yes" : "no",
             (y_good != y_sa1) ? "yes" : "no");
    
    a=0; b=1; c=1; #10;
    $display("%b %b %b |   %b    |   %b   |   %b   |       %s       |       %s", a, b, c, y_good, y_sa0, y_sa1,
             (y_good != y_sa0) ? "yes" : "no",
             (y_good != y_sa1) ? "yes" : "no");
    
    a=1; b=0; c=0; #10;
    $display("%b %b %b |   %b    |   %b   |   %b   |       %s       |       %s", a, b, c, y_good, y_sa0, y_sa1,
             (y_good != y_sa0) ? "yes" : "no",
             (y_good != y_sa1) ? "yes" : "no");
    
    a=1; b=0; c=1; #10;
    $display("%b %b %b |   %b    |   %b   |   %b   |       %s       |       %s", a, b, c, y_good, y_sa0, y_sa1,
             (y_good != y_sa0) ? "yes" : "no",
             (y_good != y_sa1) ? "yes" : "no");
    
    a=1; b=1; c=0; #10;
    $display("%b %b %b |   %b    |   %b   |   %b   |       %s       |       %s", a, b, c, y_good, y_sa0, y_sa1,
             (y_good != y_sa0) ? "yes" : "no",
             (y_good != y_sa1) ? "yes" : "no");
    
    a=1; b=1; c=1; #10;
    $display("%b %b %b |   %b    |   %b   |   %b   |       %s       |       %s", a, b, c, y_good, y_sa0, y_sa1,
             (y_good != y_sa0) ? "yes" : "no",
             (y_good != y_sa1) ? "yes" : "no");
    
    #10 $finish;
  end
endmodule