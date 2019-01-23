module mips_core(instruction, result);

input [31:0] instruction;
output reg[31:0] result;

//  instruction lari R type a gore parse edip gerekli degiskenlere atiyoruz.
wire [5:0] opCode = instruction[31:26];
wire [4:0] rs = instruction[25:21];
wire [4:0] rt = instruction[20:16];
wire [4:0] rd = instruction[15:11];
wire [4:0] shamt = instruction[10:6];
wire [5:0] funct = instruction[5:0];

wire signed[31:0] rsVal;
wire signed[31:0] rtVal;
//signalWrite i basta 0 yapiyoruz ki once read_data lari doldursun.
reg signalWrite = 1'b0;
wire clk = 0;

mips_registers findRes(rsVal,rtVal,result,rs,rt,rd,signalWrite,clk);

always @ (*) begin	
// R type olmasi icin opcode 0 olmali ve bunu kontrol edip islem yapiyoruz.
// ve Result belirlendikten sonra signalWrite i 1 yapiyoruz ki registers fonksiyonu da paralel olarak calisirken
// result u rd registerine yazan if e girsin.
	if (opCode == 6'b000000)begin
		case(funct)
			6'b100000 : begin //add
				result = rsVal+ rtVal;
				signalWrite = 1;
			 end
			6'b100001 : begin //addu
				result = $unsigned(rsVal) + $unsigned(rtVal);
				signalWrite = 1;
			end
			6'b100010 : begin //sub	
				result = rsVal - rtVal;
				signalWrite = 1;
			end
			6'b100100 : begin //and
				result = rsVal & rtVal;
				signalWrite = 1;
			end
			6'b100101 : begin //or
				result = rsVal | rtVal;
				signalWrite = 1;
			end
			6'b000011 : begin//sra 
				result = rtVal >>> shamt;
				signalWrite = 1;
			end
			6'b000010 : begin//srl
				result = rtVal >> shamt;
				signalWrite = 1;
			end
			6'b000000 : begin//sll
				result = rtVal << shamt;
				signalWrite = 1;
			end
			6'b101011 : begin//sltu
				result = ($unsigned(rsVal) < $unsigned(rtVal)) ? 1'b1:1'b0 ;
				signalWrite = 1;
			end
			default : begin
				result = 32'b0;
				signalWrite = 1'b0;
			end
		endcase
	end
	else begin
		result = 32'b0;
		signalWrite = 1'b0;
	end
end
// else kisminda da result hic ilklendirilmedigi zaman uyari verdigi icin result a deger atiyoruz ve compiler uyarı vermiyor.
endmodule