`define DELAY 20
module _5bit_adder_testbench();

reg [4:0] InpA,InpB;
reg Cin;
wire [4:0] out;
wire C;

_5bit_adder test(out,C,InpA,InpB,Cin);

initial begin
InpA = 5'b00010; InpB = 5'b11100; Cin = 1'b0; 
#`DELAY;
InpA = 5'b10001; InpB = 5'b01101; Cin = 1'b0; 
#`DELAY;
InpA = 5'b01000; InpB = 5'b11100; Cin = 1'b0; 
#`DELAY;
InpA = 5'b00100; InpB = 5'b11100; Cin = 1'b0; 
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101; Cin = 1'b0; 
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101; Cin = 1'b0; 
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101; Cin = 1'b0; 
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101; Cin = 1'b0; 

end
 
 
initial
begin
$monitor("time = %2d, InA =%5b, InB=%5b, out=%5b", $time, InpA, InpB, out);
end



endmodule