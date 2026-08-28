`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2026 12:24:37 AM
// Design Name: 
// Module Name: topfir
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

module topfir(
    input wire signed [15:0]data_in,
    input wire CLK,

    input wire CLR,
    output wire signed [23:0]data_out
    );
    //top
    wire signed [15:0] xn0, xn1, xn2, xn3, xn4, xn5, xn6, xn7, xn8, xn9;
    wire signed [15:0] xn10, xn11, xn12, xn13, xn14, xn15, xn16, xn17, xn18, xn19;
   //ton 1 xung clock
    sreg_1 uut1 (
    .CLK(CLK)
    ,.CLR(CLR)
    ,.xn(data_in)
    ,.xn0(xn0),.xn1(xn1),.xn2(xn2)
    ,.xn3(xn3),.xn4(xn4),.xn5(xn5)
    ,.xn6(xn6),.xn7(xn7),.xn8(xn8)
    ,.xn9(xn9),.xn10(xn10),.xn11(xn11)
    ,.xn12(xn12),.xn13(xn13),.xn14(xn14)
    ,.xn15(xn15),.xn16(xn16),.xn17(xn17)
    ,.xn18(xn18), .xn19(xn19)
    );
    
    nhan_cong uut2 (
    .CLK(CLK)
    ,.CLR(CLR)
    ,.xn(data_in)
    ,.xn0(xn0),.xn1(xn1),.xn2(xn2)
    ,.xn3(xn3),.xn4(xn4),.xn5(xn5)
    ,.xn6(xn6),.xn7(xn7),.xn8(xn8)
    ,.xn9(xn9),.xn10(xn10),.xn11(xn11)
    ,.xn12(xn12),.xn13(xn13),.xn14(xn14)
    ,.xn15(xn15),.xn16(xn16),.xn17(xn17)
    ,.xn18(xn18), .xn19(xn19)
    ,.DATA_OUT(data_out)
    );
endmodule
