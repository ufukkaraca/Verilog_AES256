`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2020 13:33:41
// Design Name: 
// Module Name: keyExpansion
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


module keyExpansion(
        input [3:0] kacinciTur,
        input [127:0] turBasiAnahtari,
        output wire[127:0] turSonuAnahtari

    );
    

    wire[31:0] turSabiti;
    wire[127:0] turSonuAnahtari_w;
    wire[31:0] sboxDegisimi, anahtar1, anahtar2, anahtar3, anahtar4;
    /* 4 byte (32 bit) uzerinde islem yapildigi icin giren anahtari buna 
    uyumlu sekilde parcalamamiz gerekmektedir.*/
    
    rconExchange(.rc_in(kacinciTur), .rc_out(turSabiti));
    
    
    assign anahtar1 = turBasiAnahtari[127:96];
    assign anahtar2 = turBasiAnahtari[95:64];
    assign anahtar3 = turBasiAnahtari[63:32];
    assign anahtar4 = turBasiAnahtari[31:0];
    
    /*son dort byte icin sbox islemi gerceklestiriliyor.
    olusturdugumuz sbox modulu, bit degistirme adiminda atil kalmakla
    birlikte bu asamada h?z sagliyor.*/
    
    rijndaelSBox (.ilk_deger(anahtar4[23:16]),.degistirilmis_deger(sboxDegisimi[31:24]));
    rijndaelSBox (.ilk_deger(anahtar4[15:8]),.degistirilmis_deger(sboxDegisimi[23:16]));
    rijndaelSBox (.ilk_deger(anahtar4[7:0]),.degistirilmis_deger(sboxDegisimi[15:8]));
    rijndaelSBox (.ilk_deger(anahtar4[31:24]),.degistirilmis_deger(sboxDegisimi[7:0]));
    
    /*son olarak finite field uzerindeki islemlerimizi gerceklestiriyoruz.
    bu islemlerin mantigi uzerine daha fazla bilgi rapordaki isleyis bolumunde
    belirtilen kaynaklarda bulunabilir*/
    
    assign turSonuAnahtari_w[127:96] = (sboxDegisimi ^ turSabiti) ^ anahtar1;
    assign turSonuAnahtari_w[95:64] = (sboxDegisimi ^ turSabiti) ^ (anahtar1 ^ anahtar2);
    assign turSonuAnahtari_w[63:32] = (sboxDegisimi ^ turSabiti) ^ anahtar1 ^ (anahtar2 ^ anahtar3);
    assign turSonuAnahtari_w[31:0] = (((sboxDegisimi ^ turSabiti) ^ (anahtar1 ^ anahtar2)) ^ (anahtar3 ^ anahtar4));
    
    assign turSonuAnahtari = turSonuAnahtari_w;
endmodule
