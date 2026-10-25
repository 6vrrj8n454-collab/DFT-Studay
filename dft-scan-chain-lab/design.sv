module sdf(
  input clk, input d, input si, input se, output reg q
);
  
  always @(posedge clk) begin
    if(se)
      q <= si;
    else
      q <= d;
  end  
endmodule

module scan_chain_2bit(
  input clk, input se, input scan_in, input d1, d2, output scan_out
);
  wire link;
  
  sdf u_sdf1(
    .clk(clk), .d(d1), .si(scan_in), .se(se), .q(link)
  );
  
  sdf u_sdf2(
    .clk(clk), .d(d2), .si(link), .se(se), .q(scan_out)
  );
  
endmodule