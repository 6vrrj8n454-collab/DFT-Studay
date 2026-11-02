module bad_latch(
  input en,
  input d,
  output reg q
);
  
  always @(*) begin
    if (en) begin
      q = d;
    end
  end
  
endmodule