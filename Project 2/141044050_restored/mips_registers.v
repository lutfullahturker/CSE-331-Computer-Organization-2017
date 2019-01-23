module mips_registers
( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );

	output reg[31:0] read_data_1, read_data_2;
	input [31:0] write_data;
	input [4:0] read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	
	reg [31:0] registers [31:0];
// tum kodu always icine yazdim cunku signal_reg_write  0 iken read_data lar dolup geri gidecek
// ve 1 ken de geri giden read_data lar gerekli inst. calistirip rd yi getirecek.
// always blogu da paralel olarak calisirken signal_reg_write i 1 oldugunu gorunce hesaplanan rd degerini registers
// arrayindeki gerekli yere yazacak.
	always @(*) begin		
		$readmemb ("registers.mem", registers) ;
		if (signal_reg_write == 0)begin
			read_data_1 = registers[read_reg_1];
			read_data_2 = registers[read_reg_2];
		end
		else if (signal_reg_write == 1) begin
			read_data_1 = registers[read_reg_1];
			read_data_2 = registers[read_reg_2];
			registers[write_reg] = write_data ;
		end
		else begin
			read_data_1 = 32'b0;
			read_data_2 = 32'b0;
		end
	end
	
endmodule