module tb;
    reg clk, se, scan_in, d1, d2;
    wire scan_out;

    scan_chain_2bit u_chain(
        .clk(clk), .se(se), .scan_in(scan_in), 
        .d1(d1), .d2(d2), .scan_out(scan_out)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    initial begin
      se = 1; scan_in = 1; d1 = 0; d2 = 0;
      #20;
      scan_in = 0;
      #20;
      $display("Shift-in complete. Stata:(link=%b, out=%b)", u_chain.link, scan_out);
      
      se = 0;
      d1 = 1; d2 = 1;
      #20;
      $display("Capture complete. Stata:(link=%b, out=%b)", u_chain.link, scan_out);
      
      se = 1;
      #20;
      $display("Shift-out first pat. out = %b", scan_out);
      #20;
      $display("Shift-out first pat. out = %b", scan_out);
      
      #20 $finish; 
    end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
  end
  
endmodule