`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2026 12:16:51 AM
// Design Name: 
// Module Name: TB_fre_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module TB_fre_divider(
);
    reg CLK;
    reg rs;
    wire CLK_OUT;
    
    fre_divider ketnoi (
    .CLK(CLK)
    ,.rs(rs)
    ,.CLK_OUT(CLK_OUT)
    );
    initial begin
    CLK = 0;
    rs = 1;
    #1 rs = 0;
    end
    always forever #10 CLK = ~CLK;
endmodule
