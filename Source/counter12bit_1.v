`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2026 03:36:16 PM
// Design Name: 
// Module Name: counter12bit_1
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
module counter13bit_1(
    input wire CLK,
    input wire CLR,
    output reg [12:0] Q
    );
    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin 
            Q <= 13'd0; 
        end else begin 
            if (Q == 13'd4999) 
                Q <= 13'd0; 
            else begin
                Q <= Q + 1'b1; end
        end
    end  
endmodule
