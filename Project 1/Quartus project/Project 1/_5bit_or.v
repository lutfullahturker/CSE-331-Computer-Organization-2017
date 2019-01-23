module _5bit_or(S,InA,InB);
input [4:0] InA,InB;
output [4:0] S;

or firstBit(S[0],InA[0],InB[0]);
or secondBit(S[1],InA[1],InB[1]);
or thirdBit(S[2],InA[2],InB[2]);
or fourthBit(S[3],InA[3],InB[3]);
or fifthBit(S[4],InA[4],InB[4]);



endmodule