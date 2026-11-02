module tb;
  reg en, d;
  wire q;
  
  bad_latch u_latch(.en(en), .d(d), .q(q));
  
  initial begin
    
    en = 0; d = 0;
    
    $display("--- Test the transparency of Latch ---");
    
    #10 en = 1;
    #10 d = 1; #5;
    $display("Time=%0t: en=1, d=%b -> q=%b", $time, d, q);
    
    #5 d = 0; #5;
    $display("Time=%0t: en=1, d=%d -> q=%b", $time, d, q);
    
    #10 en = 0; d = 1; #5;
    $display("Time=%0t: en=0, d=%b -> q=%b", $time, d, q);
    
    #20 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
  end
endmodule