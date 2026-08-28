`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2026 12:51:56 PM
// Design Name: 
// Module Name: SimpleDual_Bram
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
module SimpleDual_Bram(
    input wire CLK,
    input wire we,           
    input wire [12:0] addr,   
    input wire [15:0] din,         
    output reg [15:0] dout          
    );
    reg [15:0] memory [0:4999];    
    initial begin 
        $readmemb("Noise_v4_q412.txt", memory ); 
    end   
    always @(posedge CLK) begin      
        if (we) begin
            memory[addr] <= din;
        end        
        dout <= memory[addr];
    end
endmodule