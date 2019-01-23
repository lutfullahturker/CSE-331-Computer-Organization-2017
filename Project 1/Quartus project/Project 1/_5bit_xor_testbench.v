`define DELAY 20
module _5bit_xor_testbench();

reg [4:0] InpA,InpB;
wire [4:0] out;

_5bit_xor test(out,InpA,InpB);

initial begin
InpA = 5'b00010; InpB = 5'b11100; 
#`DELAY;
InpA = 5'b10001; InpB = 5'b01101; 
#`DELAY;
InpA = 5'b01000; InpB = 5'b11100;
#`DELAY;
InpA = 5'b00100; InpB = 5'b11100; 
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101; 
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101; 
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101;
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101;

end
 
 
initial
begin
$monitor("time = %2d, InA =%5b, InB=%5b, out=%5b", $time, InpA, InpB, out);
end



endmodule