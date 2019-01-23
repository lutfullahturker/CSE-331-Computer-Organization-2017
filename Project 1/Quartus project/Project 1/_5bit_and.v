module _5bit_and(S,InA,InB);
input [4:0] InA,InB;
output [4:0] S;

and firstBit(S[0],InA[0],InB[0]);
and secondBit(S[1],InA[1],InB[1]);
and thirdBit(S[2],InA[2],InB[2]);
and fourthBit(S[3],InA[3],InB[3]);
and fifthBit(S[4],InA[4],InB[4]);



endmodule