module _5bit_xor(S,InA,InB);
input [4:0] InA,InB;
output [4:0] S;

xor firstBit(S[0],InA[0],InB[0]);
xor secondBit(S[1],InA[1],InB[1]);
xor thirdBit(S[2],InA[2],InB[2]);
xor fourthBit(S[3],InA[3],InB[3]);
xor fifthBit(S[4],InA[4],InB[4]);



endmodule