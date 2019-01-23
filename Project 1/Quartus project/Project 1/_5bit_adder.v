module _5bit_adder (S,C,InA,InB,C0);
input [4:0] InA,InB;
input C0;
output C;
output [4:0] S;
wire C1,C2,C3,C4;

full_adder FA0(S[0], C1, InA[0], InB[0], C0),
				FA1(S[1], C2, InA[1], InB[1], C1),
				FA2(S[2], C3, InA[2], InB[2], C2),
				FA3(S[3], C4, InA[3], InB[3], C3),
				FA4(S[4], C, InA[4], InB[4], C4);
				
endmodule
 