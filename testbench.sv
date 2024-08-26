module tb;
  reg [7:0] a;
  wire [2:0] y;
  
  prenc dut(a,y);
  
  covergroup cpe;
    option.per_instance=1;
    
    coverpoint a{
      bins zero = {8'b00000001};
      wildcard bins one = {8'b0000001?};
      wildcard bins two = {8'b000001??};
      wildcard bins three = {8'b00001???};
      wildcard bins four = {8'b0001????};
      wildcard bins five = {8'b001?????};
      wildcard bins six = {8'b01??????};
      wildcard bins seven = {8'b1???????};
    }
    coverpoint y;
    
  endgroup
  cpe ci = new();
  initial begin
    for(int i=0;i<300;i++) begin
    a = $urandom();
    ci.sample();
    #10;
  end
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #3000;
    $finish();
  end
  
endmodule
  