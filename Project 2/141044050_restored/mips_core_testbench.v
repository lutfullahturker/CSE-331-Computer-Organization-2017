module mips_testbench ();

reg [31:0] instruction_set;
wire [31:0] result;
reg [31:0] registers [31:0];

mips_core test(instruction_set,result);



initial begin
	instruction_set = 32'b00000001010001010000100000100000; #10;
	instruction_set = 32'b00000001010001010100000000100001; #10;
	instruction_set = 32'b00000001010001010000100000100010; #10;
	instruction_set = 32'b00000001010001010001000000100100; #10;
	instruction_set = 32'b00000001010001010001000000100101; #10;
	instruction_set = 32'b00000001010001010010100010000011; #10;
	instruction_set = 32'b00000001010001010010000010100010; #10;
	instruction_set = 32'b00000001010001010010100010000000; #10;
	instruction_set = 32'b00000001010001010010100000101011; #10;
end

always @ (*) begin
	$readmemb("registers.mem", registers);
	registers[instruction_set[15:11]] = result;
	$writememb("registers.mem", registers);
end

initial begin
	$monitor("time = %2d,instruction = %32b, Result = %32b", $time,instruction_set,result);
end



endmodule