`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2026 12:48:29 PM
// Design Name: 
// Module Name: sreg_1
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
module sreg_1(
    input wire [15:0] xn,
    input wire CLK,
    input wire CLR,
    output reg signed [15:0] xn0, xn1, xn2, xn3, xn4, xn5, xn6, xn7, xn8, xn9,
    output reg signed [15:0] xn10, xn11, xn12, xn13, xn14, xn15, xn16, xn17, xn18, xn19
    );

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            xn0 <= 16'sd0; xn1 <= 16'sd0; xn2 <= 16'sd0; xn3 <= 16'sd0;
            xn4 <= 16'sd0; xn5 <= 16'sd0; xn6 <= 16'sd0; xn7 <= 16'sd0;
            xn8 <= 16'sd0; xn9 <= 16'sd0; xn10 <= 16'sd0; xn11 <= 16'sd0;
            xn12 <= 16'sd0; xn13 <= 16'sd0; xn14 <= 16'sd0; xn15 <= 16'sd0;
            xn16 <= 16'sd0; xn17 <= 16'sd0; xn18 <= 16'sd0; xn19 <= 16'sd0;
        end else begin
            xn0  <= xn;
            xn1  <= xn0;
            xn2  <= xn1;
            xn3  <= xn2;
            xn4  <= xn3;
            xn5  <= xn4;
            xn6  <= xn5;
            xn7  <= xn6;
            xn8  <= xn7;
            xn9  <= xn8;
            xn10 <= xn9;
            xn11 <= xn10;
            xn12 <= xn11;
            xn13 <= xn12;
            xn14 <= xn13;
            xn15 <= xn14;
            xn16 <= xn15;
            xn17 <= xn16;
            xn18 <= xn17;
            xn19 <= xn18;
        end
    end
endmodule
