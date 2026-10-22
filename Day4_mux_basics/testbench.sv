module tb;
  reg clk, a, b, sel;
  wire q;
  
  mux_dff u_dut(.clk(clk), .a(a), .b(b), .sel(sel), .q(q));
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  initial begin
    a = 0; b = 1; sel = 0;
    #25;
    sel = 1;
    $display("Time=%0t: sel changed to 1. y=%b, q=%b",$time,u_dut.y, q);
    
    #5;
    $display("Time=%0t: After clock edge. y=%b, q=%b",$time, u_dut.y, q);
    
    a = 1; b = 0;
    #10;
    $display("Time=%0t: Inputs changed. y=%b, q=%b",$time, u_dut.y, q);
    
    #10;
    $display("Time=%0t: After clock edge. y=%b, q=%b",$time,u_dut.y,q);
    
    #10 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule