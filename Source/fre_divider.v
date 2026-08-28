`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2026 12:12:09 AM
// Design Name: 
// Module Name: fre_divider
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

module fre_divider(
    input wire CLK,
    input wire rs,
    output reg CLK_OUT
    );
    reg [16:0] counter;
    always @(posedge CLK or posedge rs) begin
        if (rs) begin
            counter <= 17'd0;
            CLK_OUT <= 1'b0;
        end else if ( !rs ) begin
            if (counter == 17'd49999) begin
                counter <= 17'd0;
                CLK_OUT <= ~CLK_OUT; 
            end else if ( counter != 17'd49999) begin
                counter <= counter + 1'b1;
            end
        end
    end
endmodule
