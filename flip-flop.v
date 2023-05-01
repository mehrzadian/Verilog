module jkff (output reg q, qbar, input j,k,clk,clr);

always @ (posedge clk) 
if (clr == 1'b1)
begin 
q<=1'b0;
qbar<=1'b1;
end
else
case({j,k})
2'b00: begin q<=q; qbar<=qbar; end
2'b01: begin q<=1'b0; qbar<=1'b1; end
2'b10: begin q<=1'b1; qbar<=1'b0; end
2'b11: begin q<=~q; qbar<=~qbar; end
default : {q,qbar} <= 2'bxx;
endcase
endmodule


