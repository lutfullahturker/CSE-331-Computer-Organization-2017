module likeALU(out,InA,InB,Select);
input [4:0] InA,InB;
input [1:0] Select;
output [4:0] out;

wire [4:0] AndRes,OrRes,XorRes,AddRes,AndResult,OrResult,XorResult,AddResult;  
wire NS0, NS1,C0,C1;
wire [4:0] C;

assign C1 = 0;

not NotS0(NS0, Select[0]);
not NotS1(NS1, Select[1]);

_5bit_and AandB(AndRes,InA,InB);
_5bit_adder AaddB(AddRes,C0,InA,InB,C1);
_5bit_or AorB(OrRes,InA,InB);
_5bit_xor AxorB(XorRes,InA,InB);

and a1(AndResult[0],AndRes[0],NS0,NS1);
and a2(AndResult[1],AndRes[1],NS0,NS1);
and a3(AndResult[2],AndRes[2],NS0,NS1);
and a4(AndResult[3],AndRes[3],NS0,NS1);
and a5(AndResult[4],AndRes[4],NS0,NS1);


and b1(AddResult[0],AddRes[0],NS1,Select[0]);
and b2(AddResult[1],AddRes[1],NS1,Select[0]);
and b3(AddResult[2],AddRes[2],NS1,Select[0]);
and b4(AddResult[3],AddRes[3],NS1,Select[0]);
and b5(AddResult[4],AddRes[4],NS1,Select[0]);


and c1(OrResult[0],OrRes[0],Select[1],NS0);
and c2(OrResult[1],OrRes[1],Select[1],NS0);
and c3(OrResult[2],OrRes[2],Select[1],NS0);
and c4(OrResult[3],OrRes[3],Select[1],NS0);
and c5(OrResult[4],OrRes[4],Select[1],NS0);


and d1(XorResult[0],XorRes[0],Select[0],Select[1]);
and d2(XorResult[1],XorRes[1],Select[0],Select[1]);
and d3(XorResult[2],XorRes[2],Select[0],Select[1]);
and d4(XorResult[3],XorRes[3],Select[0],Select[1]);
and d5(XorResult[4],XorRes[4],Select[0],Select[1]);

or final1(out[0],AndResult[0],OrResult[0],AddResult[0],XorResult[0]);
or final2(out[1],AndResult[1],OrResult[1],AddResult[1],XorResult[1]);
or final3(out[2],AndResult[2],OrResult[2],AddResult[2],XorResult[2]);
or final4(out[3],AndResult[3],OrResult[3],AddResult[3],XorResult[3]);
or final5(out[4],AndResult[4],OrResult[4],AddResult[4],XorResult[4]);

endmodule