module clk_div ( outclk,inclk);

input  inclk  ;
output outclk ;

reg [3:0]count ;

always @(posedge inclk )
begin
    if (count < 4'd4)
        count <= count + 1 ;
    else
        count <= 4'b0; 
end

assign  outclk = (count <= 4'd2) ;

endmodule //clk_div