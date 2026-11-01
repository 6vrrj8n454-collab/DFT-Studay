module good_circuit(input a, input b, input c, output y);
  wire w;
  assign w = a & b;
  assign y = w | c;
endmodule

module fault_sa0(input a, input b, input c, output y);
  wire w = 1'b0;
  assign y = w | c;
endmodule

module fault_sa1(input a, input b, input c, output y);
  wire w = 1'b1;
  assign y = w | c;
endmodule