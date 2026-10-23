module tb;
  reg clk, d, si, se;
  wire q;
  
  sdf u_sdf(.clk(clk), .d(d), .si(si), .se(se), .q(q));
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  initial begin
    
    d = 0; si = 0; se = 0;
    
    #5 d = 1; si = 0; se = 0;
    #20 $display("Time=%0t:[se=0] d=%b, si=%b -> q=%b (Expected result  q=1)", $time, d, si, q);
    
    #10 d = 0; si = 1; se = 1;
    #20 $display("Time=%0t:[se=1] d=%b, si=%b -> q=%b (Expected result  q=1)", $time, d, si, q);
    
    #10 d = 1; si = 0; se = 1;
    #20 $display("Time=%0t:[se=1] d=%b, si=%b -> q=%b (Expected result  q=0)", $time, d, si, q);
    
    #20 $finish;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
  
endmodule