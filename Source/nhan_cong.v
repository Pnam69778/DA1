`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2026 02:06:18 PM
// Design Name: 
// Module Name: nhan_cong
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
module nhan_cong(
    input wire signed [15:0] xn, xn0, xn1, xn2, xn3, xn4, xn5, xn6, xn7, xn8, xn9,
    input wire signed [15:0] xn10, xn11, xn12, xn13, xn14, xn15, xn16, xn17, xn18, xn19,
    input wire CLK,
    input wire CLR,
    output reg signed [23:0] DATA_OUT
    );
    (* mark_debug = "true" *) reg signed [36:0] SUM;
parameter signed [15:0] h0  = 16'h0000,
                        h1  = 16'hfeb1,
                        h2  = 16'h013a,
                        h3  = 16'h01c7,
                        h4  = 16'hfbf2,
                        h5  = 16'h0000,
                        h6  = 16'h07f7,
                        h7  = 16'hf8d3,
                        h8  = 16'hf48c,
                        h9  = 16'h2674,
                        h10 = 16'h4d25, // trung tam
                        h11 = 16'h2674,
                        h12 = 16'hf48c,
                        h13 = 16'hf8d3,
                        h14 = 16'h07f7,
                        h15 = 16'h0000,
                        h16 = 16'hfbf2,
                        h17 = 16'h01c7,
                        h18 = 16'h013a,
                        h19 = 16'hfeb1,
                        h20 = 16'h0000;
// 16x16 => max 32 bit
reg signed [31:0] p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, 
                  p11, p12, p13, p14, p15, p16, p17, p18, p19, p20;
always @(posedge CLK or posedge CLR )
begin
     if (CLR) begin
        p0  <= 0;
        p1  <= 0;
        p2  <= 0;
        p3  <= 0;
        p4  <= 0;
        p5  <= 0;
        p6  <= 0;
        p7  <= 0;
        p8  <= 0;
        p9  <= 0;
        p10 <= 0;
        p11 <= 0;
        p12 <= 0;
        p13 <= 0;
        p14 <= 0;
        p15 <= 0;
        p16 <= 0;
        p17 <= 0;
        p18 <= 0;
        p19 <= 0;
        p20 <= 0;
    end
    else begin
        p0  <= h0  * xn;
        p1  <= h1  * xn0;
        p2  <= h2  * xn1;
        p3  <= h3  * xn2;
        p4  <= h4  * xn3;
        p5  <= h5  * xn4;
        p6  <= h6  * xn5;
        p7  <= h7  * xn6;
        p8  <= h8  * xn7;
        p9  <= h9  * xn8;
        p10 <= h10 * xn9;
        p11 <= h11 * xn10;
        p12 <= h12 * xn11;
        p13 <= h13 * xn12;
        p14 <= h14 * xn13;
        p15 <= h15 * xn14;
        p16 <= h16 * xn15;
        p17 <= h17 * xn16;
        p18 <= h18 * xn17;
        p19 <= h19 * xn18;
        p20 <= h20 * xn19;
    end
end
reg signed [39:0] s [0:10];
integer j;
always @(posedge CLK or posedge CLR )
begin
    if (CLR) begin
    for (j = 0; j <= 10; j = j + 1) 
        begin 
            s[j] <= 40'sd0; 
        end
    SUM <= 37'sd0;
    end
    else begin 
//    s[0]  <= p0 + p1;   s[1]  <= p2 + p3;   s[2]  <= p4 + p5;
//    s[3]  <= p6 + p7;   s[4]  <= p8 + p9;   s[5]  <= p10 + p11;
//    s[6]  <= p12 + p13; s[7]  <= p14 + p15; s[8]  <= p16 + p17;
//    s[9]  <= p18 + p19; s[10] <= p20;   
        
//    SUM <= s[0] + s[1] + s[2] + s[3] + s[4] + s[5] + s[6] + s[7] + s[8] + s[9] + s[10];
    SUM <= p0 + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9 +
        p10 + p11 + p12 + p13 + p14 + p15 + p16 + p17 +
        p18 + p19 + p20;
    end
end

//wire [6:0] kiemtra = 7'b0000000; 
wire signed [36:0] multadd = SUM + 7'd64; //7'b100 0000
//reg phat_hien_tp;
//reg signed [36:0] multadd_reg;

//always @(posedge CLK or posedge CLR) begin
//    if (CLR) begin
//        phat_hien_tp <= 1'b0;
//        multadd_reg <= 37'sd0;
//    end else begin
//        phat_hien_tp <= (multadd[6:0] == kiemtra); //kiem tra 7 bit thap co = 0 k?
//        multadd_reg <= multadd;
//    end
//end

//always @(posedge CLK or posedge CLR) begin
//    if (CLR) begin
//        DATA_OUT <= 24'sd0;
//    end else begin
//        DATA_OUT <= phat_hien_tp ? {multadd_reg[30:8], 1'b0} : multadd_reg[30:7];
//    end
//end

always @(posedge CLK or posedge CLR) begin
    if (CLR) begin
        DATA_OUT <= 24'sd0;
    end else begin
        // Kiểm tra trực tiếp 7 bit thấp của đường dây `multadd` và gán thẳng kết quả
        if (multadd[6:0] == 7'b0000000) begin
            DATA_OUT <= {multadd[30:8], 1'b0}; // Tròn về số chẵn nếu đúng mốc 0.5
        end else begin
            DATA_OUT <= multadd[30:7];         // Làm tròn thông thường
        end
    end
end
endmodule