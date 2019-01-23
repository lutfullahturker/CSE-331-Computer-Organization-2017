`define DELAY 20
module likeALU_testbench();

reg [4:0] InpA,InpB;
reg [1:0] Select;  
wire [4:0] out;

likeALU test(out,InpA,InpB,Select);

initial begin
InpA = 5'b00010; InpB = 5'b11100; Select = 2'b00;
#`DELAY;
InpA = 5'b10001; InpB = 5'b01101; Select = 2'b01;
#`DELAY;
InpA = 5'b01000; InpB = 5'b11100; Select = 2'b10;
#`DELAY;
InpA = 5'b00100; InpB = 5'b11100; Select = 2'b11;
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101; Select = 2'b00;
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101; Select = 2'b01;
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101; Select = 2'b10;
#`DELAY;
InpA = 5'b10101; InpB = 5'b01101; Select = 2'b11;

end
 
 
initial
begin
$monitor("time = %2d, InA =%5b, InB=%5b, select=%2b, out=%5b", $time, InpA, InpB, Select, out);
end



endmodule