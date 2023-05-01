// implementation of signed and unsgned comparator
module unsigned_comparator(o2,o1,o0, a2, a1, a0, b2, b1, b0);
input a2,a1,a0,b2,b1,b0;
output o2,o1,o0;
assign o1 = ((~a2 & ~b2) | (a2 & b2)) & ((~a1 & ~b1) | a1 & b1) & (~a0 & ~b0 | a0 & b0); // A=B
assign o0 = (a2 & ~b2) | (((~a2&~b2) | (a2&b2) )&(a1&~b1)) | ( ( (~a2&~b2) | (a2&b2) ) &((~a1&~b1) | (a1 &b1))& a0&~b0);// A>B
assign o2 = (~a2 & b2) | (((~a2&~b2) | (a2&b2) )&(~a1&b1)) | ( ( (~a2&~b2) | (a2&b2) ) &((~a1&~b1) | (a1 &b1))& ~a0&b0);// A<B
//if ({a2,a1,a0} > {b2,b1,b0}) begin
//	o0 = 1;
//end 
//else if ({a2,a1,a0} == {b2,b1,b0})begin
//	o1 =1;
//end else
//	o2 =1;

endmodule

module tb_unsigned_comparator;
reg a2,a1,a0,b2,b1,b0;
wire o2,o1,o0;
unsigned_comparator comp(o2,o1,o0, a2,a1,a0, b2,b1,b0);
initial
begin 
{a2,a1,a0, b2,b1,b0}=6'b0;
repeat(200)
#30 {a2,a1,a0, b2,b1,b0}={a2,a1,a0, b2,b1,b0}+1'b1;
end
endmodule


module signed_comparator3Bit(input [2:0] a, b,output reg[2:0] o);

always @(a,b)
begin
    if (a==b) begin 
        o = 3'b010;
	end
    else begin
	if (a[2]==b[2] && a[2]==1) begin
		if (a < b)
        		o = 3'b001;
		else
			o = 3'b100;
	end
    	if (a[2]==b[2] && a[2]==0) begin
		if (a < b)
        		o = 3'b100;
		else
			o = 3'b001;
	end
	end
        
end
endmodule

module tb_signed_comparator;
reg [2:0]a,b;
wire [2:0]o;
signed_comparator3Bit comp(a, b, o);
initial
begin 
{a,b}=6'b0;
repeat(200)
#30 {a,b}={a,b}+1'b1;
end
endmodule
