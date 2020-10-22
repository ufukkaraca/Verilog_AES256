`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2020 12:38:44
// Design Name: 
// Module Name: MixColumns
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


module sutunKaristirma(
input [127:0] gelen_sayi,
output reg [127:0] cikis 
    );
    reg [7:0] hafiza [15:0];
    reg [7:0] hafiza2 [15:0];
    reg [1:0] fonksiyon [15:0]; 
    integer i; 
    integer g; 
     integer d;
    initial begin 
    for (i = 0; i < 16; i = i + 1) begin
    hafiza[i]=gelen_sayi[(7)+i*8-:8];
    end
    fonksiyon[0]=2;
    fonksiyon[1]=3;
    fonksiyon[2]=1;
    fonksiyon[3]=1;
    fonksiyon[4]=1;
    fonksiyon[5]=2;
    fonksiyon[6]=3;
    fonksiyon[7]=1;
    fonksiyon[8]=1;
    fonksiyon[9]=1;
    fonksiyon[10]=2;
    fonksiyon[11]=3;
    fonksiyon[12]=3;
    fonksiyon[13]=1;
    fonksiyon[14]=1;
    fonksiyon[15]=2;
    end
    always@* begin
         for (d=0;d<4;d=d+1)begin      
    hafiza2[d]=(hafiza[d]*fonksiyon[d*4])^(hafiza[d+4]*fonksiyon[1+d*4])^(hafiza[d+8]*fonksiyon[d*4+2])^(hafiza[d+12]*fonksiyon[d*4+3]);   
    end
     cikis[7:0]=hafiza2[0];
     cikis[15:8]=hafiza2[1];
     cikis[23:16]=hafiza2[2];
     cikis[31:24]=hafiza2[3];
     cikis[39:32]=hafiza2[4]; 
     cikis[47:40]=hafiza2[5];
     cikis[55:48]=hafiza2[6];
     cikis[63:56]=hafiza2[7];
     cikis[71:64]=hafiza2[8];
     cikis[79:72]=hafiza2[9];
     cikis[87:80]=hafiza2[10];
     cikis[95:88]=hafiza2[11];
     cikis[103:96]=hafiza2[12];
     cikis[111:104]=hafiza2[13];
     cikis[119:112]=hafiza2[14];
     cikis[127:120]=hafiza2[15];   
    end
endmodule
