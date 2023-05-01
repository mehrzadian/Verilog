module fourbitAdder(s,co,a,b,ci);
output [3:0]s;
output co;
wire [2:0]c;
input [3:0]a,b;
input ci;
fullAdder firstbit (s[0],c[0],a[0],b[0],ci);
fullAdder sectbit (s[1],c[1],a[1],b[1],c[0]);
fullAdder thirdbit (s[2],c[2],a[2],b[2],c[1]);
fullAdder fourthbit (s[3],co,a[3],b[3],c[2]);
endmodule



module tb_fourbitAdder;
wire [3:0]s;
wire co;
reg [3:0]a;
reg [3:0]b;
reg ci;
fourbitAdder fba(s,co,a,b,ci);
initial
begin 
{a,b,ci} = 9'b000000000;
repeat(511)
#20 {a,b,ci} = {a,b,ci}+9'b000000001;
end


endmodule