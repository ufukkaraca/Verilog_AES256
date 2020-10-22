`timescale 1ns / 1ps
 
module satirKaydirma(
    input[127:0] giris,
    output [127:0] cikis
    
    );//8x16 maris duzenine gore bolunmustur 
     assign cikis={ giris[126:112],giris[127],giris [110:96],giris[111],giris[94:80],giris[95],giris[78:64],giris[79],giris[62:48],giris[63],giris [46:32],giris[47],giris[30:16],giris[31],giris[14:0],giris[15] };
   
    
endmodule

