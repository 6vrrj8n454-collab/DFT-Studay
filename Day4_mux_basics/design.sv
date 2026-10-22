module mux_dff(
  input clk,
  input a,
  input b,
  input sel,
  output reg q
);
  
  wire y;
  assign y = sel ? b : a;
  
  always @(posedge clk) begin
    q <= y;
  end
  
endmodule