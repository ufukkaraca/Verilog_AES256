`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TOBB University of Economics and Technology
// Engineer: Ufuk Karaca
// 
// Create Date: 22.07.2020 18:49:12
// Design Name: AES Encryption
// Module Name: anaModul
// Project Name: BIL264 Term Project
//////////////////////////////////////////////////////////////////////////////////


module anaModul(
    input clk,
    input rst,
    input[127:0] anahtar, //girisler array, blok olarak geliyor
    input j,
    input wire[127:0] blok,
    output wire[127:0] sifre,   
    output wire[127:0] turAnahtari
    );
    
    wire[127:0] w0, w1, w2; //ic kablolar
    reg[127:0] s1;    


    keyExpansion(.kacinciTur(j), .turBasiAnahtari(anahtar), .turSonuAnahtari(turAnahtari));              
    bitDegistirme (.giren_kod(blok), .cikan_kod_w(w0));
    satirKaydirma(.giris(w0), .cikis(w1));
    sutunKaristirma(.gelen_sayi(w1), .cikis(w2));
    
    always@(posedge clk, negedge rst)begin
        if(!rst)begin
            if(j!=9)begin
            s1=w2^turAnahtari;
            end
            if(j==9)begin
            s1 = w1^turAnahtari;
            end
        end
    end

    assign sifre = s1;

endmodule
