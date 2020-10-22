`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.08.2020 10:04:57
// Design Name: 
// Module Name: yurutucuModul
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


module yurutucuModul(
    input clk,
    input rst,
    input[127:0] anahtar1, //girisler array, blok olarak geliyor
    input wire[127:0] blok,
    input g_gecerli,
    output reg hazir,
    output reg[127:0] sifre,
    output reg c_gecerli    
    );
    wire[127:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9; //ciktilar
    wire[127:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10; //anahtarlar
    assign a0 = anahtar1;
    
    initial begin
        hazir=1'b1; //initial bloguna ozel olarak hazir bulunuyoruz.
        wait(g_gecerli==1'b1); //girisin gecerli olmasini bekliyoruz
        
        hazir=1'b0; /*giris gecerli olduktan sonra, islem bitene kadar
        bir daha hazir oldugumuzu belirtmeyecegiz.*/

    end
    
    anaModul m0(.clk(clk), .rst(rst), .anahtar(a0), .j(0), .blok(blok), .sifre(w0), .turAnahtari(a1));
    anaModul m1(.clk(clk), .rst(rst), .anahtar(a1), .j(1), .blok(w0), .sifre(w1), .turAnahtari(a2));
    anaModul m2(.clk(clk), .rst(rst), .anahtar(a2), .j(2), .blok(w1), .sifre(w2), .turAnahtari(a3));
    anaModul m3(.clk(clk), .rst(rst), .anahtar(a3), .j(3), .blok(w2), .sifre(w3), .turAnahtari(a4));
    anaModul m4(.clk(clk), .rst(rst), .anahtar(a4), .j(4), .blok(w3), .sifre(w4), .turAnahtari(a5));
    anaModul m5(.clk(clk), .rst(rst), .anahtar(a5), .j(5), .blok(w4), .sifre(w5), .turAnahtari(a6));
    anaModul m6(.clk(clk), .rst(rst), .anahtar(a6), .j(6), .blok(w5), .sifre(w6), .turAnahtari(a7));
    anaModul m7(.clk(clk), .rst(rst), .anahtar(a7), .j(7), .blok(w6), .sifre(w7), .turAnahtari(a8));
    anaModul m8(.clk(clk), .rst(rst), .anahtar(a8), .j(8), .blok(w7), .sifre(w8), .turAnahtari(a9));
    anaModul m9(.clk(clk), .rst(rst), .anahtar(a9), .j(9), .blok(w8), .sifre(w9), .turAnahtari(a10));
    
    
    always@*begin
        c_gecerli=1'b1;
        hazir=1'b1;
        sifre = w9;
    end
    
endmodule
