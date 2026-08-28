`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2026 01:36:56 PM
// Design Name: 
// Module Name: TB_SimpleDual_Bram
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
module TB_SimpleDual_Bram();
    reg CLK;
    reg we;
    reg [12:0] addr;
    reg [15:0] din;
    wire [15:0] dout;

    SimpleDual_Bram uut ( 
        .CLK(CLK),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );
    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK; 
    end
    initial begin 
        we   = 1'b0;      
        addr = 13'b0;     
        din  = 16'h0000;  
        //$readmemb("TB_SimpleDualBram.txt", uut.memory);
        #20 we = 1'b1;
        addr = 13'd5;
        din = 16'd99;
    end

//    always @(posedge CLK) begin 
//        #5; 
//        if (addr == 13'd4999) begin
//            addr <= 13'd0;
//        end else begin
//            addr <= addr + 1'b1;
//        end
//    end 
    
endmodule
