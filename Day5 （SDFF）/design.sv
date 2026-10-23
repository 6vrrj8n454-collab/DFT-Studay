module sdf(
  input clk,
  input d,
  input si,
  input se,
  output reg q
);
  
  always @(posedge clk) begin
    
    if(se)
      q <= si;
    else
      q <= d;
  end
  
endmodule