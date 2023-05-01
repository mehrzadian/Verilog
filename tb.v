
module tb_jkff;
reg j,k,clk,clr;
wire q,qbar;

jkff jkFlipFlop(q,qbar,j,k,clk,clr);

initial 
begin
{clr,j,k,clk}=4'b0000;
repeat(32)
#30 {clr,j,k,clk} = {clr,j,k,clk} +1'b1;

end
endmodule

module tb_3bitBdirectionalCounter;
reg clk,clr,mode,set;
reg [2:0] setnum;
wire [2:0]count;
bidirectional3bitCounter  counter( count, clr, clk, mode, set, setnum);
initial 
begin
setnum=3'b0;
clr=0;
set= 1;
clk = 0;
mode = 0;
#7 set=0;
forever #5 clk = ~clk;
forever #100 {setnum,set} = {setnum,set} + 1'b1;
forever #20 mode = ~mode;

forever #1000 clr =~clr;




end

endmodule