`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 11:26:03 PM
// Design Name: 
// Module Name: top_test
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
module top_test(
    input wire CLK,
    input wire CLR,
    input wire we,
    input wire [15:0] data_in,
    output wire [23:0] data_out
    );

    wire [12:0] diachitop;
    wire [15:0] datatop;
    wire CLK_TOP; 
    
    fre_divider ketnoi (
    .CLK(CLK)
    ,.rs(CLR)
    ,.CLK_OUT(CLK_TOP)
    );
    
    counter13bit_1 ketnoi1 (
    .CLK(CLK_TOP)
    ,.CLR(CLR)
    ,.Q(diachitop)
    );
    
    SimpleDual_Bram ketnoi2(
    .CLK(CLK_TOP)
    ,.we(we)
    ,.addr(diachitop)
    ,.din(data_in)
    ,.dout(datatop)
    );
    
    topfir ketnoi3 (
    .CLK(CLK_TOP)
    ,.CLR(CLR)
    ,.data_in(datatop)
    ,.data_out(data_out)
    );

endmodule
