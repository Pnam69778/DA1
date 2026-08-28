`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 02:45:22 AM
// Design Name: 
// Module Name: TB_counter13bit
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
module TB_counter13bit(
    );
    reg CLK;
    reg CLR;
    wire [12:0]counter;
    counter13bit_1 ketnoi(
    .CLK(CLK)
    ,.CLR(CLR)
    ,.Q(counter)
    );
    initial begin 
        CLR = 1;
        CLK = 0;
        #5 CLR = 0;
    end
always forever #10 CLK = ~CLK;
endmodule
