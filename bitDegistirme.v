`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TOBB University of Economics and Technology
// Engineer: Ufuk Karaca
// 
// Create Date: 22.07.2020 20:47:13
// Design Name: AES Encryption
// Module Name: bitDegistirme
// Project Name: BIL264 Term Project
//////////////////////////////////////////////////////////////////////////////////

/*----------------------------------------------------------------------
 On Not: Bu modulde, S-Box olarak standart Rijndael S-Box kullanilmistir
Ayr?ca, hiz adina olabildigince looplardan kacinilmistir.
---------------------------------------------------------------------**/

module bitDegistirme(
    input[127:0] giren_kod,
    output wire[127:0] cikan_kod_w
    );
    
    reg[7:0] ilk_deger[15:0];
    reg[7:0] degistirilmis_deger;
    reg[127:0] cikan_kod; 
    integer i;
    
    always@*begin //always basi  
    
        ilk_deger[0][7:0]=giren_kod[7:0];
        ilk_deger[1][7:0]=giren_kod[15:8];
        ilk_deger[2][7:0]=giren_kod[23:16];
        ilk_deger[3][7:0]=giren_kod[31:24];
        ilk_deger[4][7:0]=giren_kod[39:32];
        ilk_deger[5][7:0]=giren_kod[47:40];
        ilk_deger[6][7:0]=giren_kod[55:48];
        ilk_deger[7][7:0]=giren_kod[63:56];
        ilk_deger[8][7:0]=giren_kod[71:64];
        ilk_deger[9][7:0]=giren_kod[79:72];
        ilk_deger[10][7:0]=giren_kod[87:80];
        ilk_deger[11][7:0]=giren_kod[95:88];
        ilk_deger[12][7:0]=giren_kod[103:96];
        ilk_deger[13][7:0]=giren_kod[111:104];
        ilk_deger[14][7:0]=giren_kod[119:112];
        ilk_deger[15][7:0]=giren_kod[127:120];

        
        for(i=0; i<16; i=i+1)begin //for basi
      
            case(ilk_deger[i]) //rijndael degistirme case basi
               8'h00: degistirilmis_deger=8'h63;
               8'h01: degistirilmis_deger=8'h7c;
               8'h02: degistirilmis_deger=8'h77;
               8'h03: degistirilmis_deger=8'h7b;
               8'h04: degistirilmis_deger=8'hf2;
               8'h05: degistirilmis_deger=8'h6b;
               8'h06: degistirilmis_deger=8'h6f;
               8'h07: degistirilmis_deger=8'hc5;
               8'h08: degistirilmis_deger=8'h30;
               8'h09: degistirilmis_deger=8'h01;
               8'h0a: degistirilmis_deger=8'h67;
               8'h0b: degistirilmis_deger=8'h2b;
               8'h0c: degistirilmis_deger=8'hfe;
               8'h0d: degistirilmis_deger=8'hd7;
               8'h0e: degistirilmis_deger=8'hab;
               8'h0f: degistirilmis_deger=8'h76;
               8'h10: degistirilmis_deger=8'hca;
               8'h11: degistirilmis_deger=8'h82;
               8'h12: degistirilmis_deger=8'hc9;
               8'h13: degistirilmis_deger=8'h7d;
               8'h14: degistirilmis_deger=8'hfa;
               8'h15: degistirilmis_deger=8'h59;
               8'h16: degistirilmis_deger=8'h47;
               8'h17: degistirilmis_deger=8'hf0;
               8'h18: degistirilmis_deger=8'had;
               8'h19: degistirilmis_deger=8'hd4;
               8'h1a: degistirilmis_deger=8'ha2;
               8'h1b: degistirilmis_deger=8'haf;
               8'h1c: degistirilmis_deger=8'h9c;
               8'h1d: degistirilmis_deger=8'ha4;
               8'h1e: degistirilmis_deger=8'h72;
               8'h1f: degistirilmis_deger=8'hc0;
               8'h20: degistirilmis_deger=8'hb7;
               8'h21: degistirilmis_deger=8'hfd;
               8'h22: degistirilmis_deger=8'h93;
               8'h23: degistirilmis_deger=8'h26;
               8'h24: degistirilmis_deger=8'h36;
               8'h25: degistirilmis_deger=8'h3f;
               8'h26: degistirilmis_deger=8'hf7;
               8'h27: degistirilmis_deger=8'hcc;
               8'h28: degistirilmis_deger=8'h34;
               8'h29: degistirilmis_deger=8'ha5;
               8'h2a: degistirilmis_deger=8'he5;
               8'h2b: degistirilmis_deger=8'hf1;
               8'h2c: degistirilmis_deger=8'h71;
               8'h2d: degistirilmis_deger=8'hd8;
               8'h2e: degistirilmis_deger=8'h31;
               8'h2f: degistirilmis_deger=8'h15;
               8'h30: degistirilmis_deger=8'h04;
               8'h31: degistirilmis_deger=8'hc7;
               8'h32: degistirilmis_deger=8'h23;
               8'h33: degistirilmis_deger=8'hc3;
               8'h34: degistirilmis_deger=8'h18;
               8'h35: degistirilmis_deger=8'h96;
               8'h36: degistirilmis_deger=8'h05;
               8'h37: degistirilmis_deger=8'h9a;
               8'h38: degistirilmis_deger=8'h07;
               8'h39: degistirilmis_deger=8'h12;
               8'h3a: degistirilmis_deger=8'h80;
               8'h3b: degistirilmis_deger=8'he2;
               8'h3c: degistirilmis_deger=8'heb;
               8'h3d: degistirilmis_deger=8'h27;
               8'h3e: degistirilmis_deger=8'hb2;
               8'h3f: degistirilmis_deger=8'h75;
               8'h40: degistirilmis_deger=8'h09;
               8'h41: degistirilmis_deger=8'h83;
               8'h42: degistirilmis_deger=8'h2c;
               8'h43: degistirilmis_deger=8'h1a;
               8'h44: degistirilmis_deger=8'h1b;
               8'h45: degistirilmis_deger=8'h6e;
               8'h46: degistirilmis_deger=8'h5a;
               8'h47: degistirilmis_deger=8'ha0;
               8'h48: degistirilmis_deger=8'h52;
               8'h49: degistirilmis_deger=8'h3b;
               8'h4a: degistirilmis_deger=8'hd6;
               8'h4b: degistirilmis_deger=8'hb3;
               8'h4c: degistirilmis_deger=8'h29;
               8'h4d: degistirilmis_deger=8'he3;
               8'h4e: degistirilmis_deger=8'h2f;
               8'h4f: degistirilmis_deger=8'h84;
               8'h50: degistirilmis_deger=8'h53;
               8'h51: degistirilmis_deger=8'hd1;
               8'h52: degistirilmis_deger=8'h00;
               8'h53: degistirilmis_deger=8'hed;
               8'h54: degistirilmis_deger=8'h20;
               8'h55: degistirilmis_deger=8'hfc;
               8'h56: degistirilmis_deger=8'hb1;
               8'h57: degistirilmis_deger=8'h5b;
               8'h58: degistirilmis_deger=8'h6a;
               8'h59: degistirilmis_deger=8'hcb;
               8'h5a: degistirilmis_deger=8'hbe;
               8'h5b: degistirilmis_deger=8'h39;
               8'h5c: degistirilmis_deger=8'h4a;
               8'h5d: degistirilmis_deger=8'h4c;
               8'h5e: degistirilmis_deger=8'h58;
               8'h5f: degistirilmis_deger=8'hcf;
               8'h60: degistirilmis_deger=8'hd0;
               8'h61: degistirilmis_deger=8'hef;
               8'h62: degistirilmis_deger=8'haa;
               8'h63: degistirilmis_deger=8'hfb;
               8'h64: degistirilmis_deger=8'h43;
               8'h65: degistirilmis_deger=8'h4d;
               8'h66: degistirilmis_deger=8'h33;
               8'h67: degistirilmis_deger=8'h85;
               8'h68: degistirilmis_deger=8'h45;
               8'h69: degistirilmis_deger=8'hf9;
               8'h6a: degistirilmis_deger=8'h02;
               8'h6b: degistirilmis_deger=8'h7f;
               8'h6c: degistirilmis_deger=8'h50;
               8'h6d: degistirilmis_deger=8'h3c;
               8'h6e: degistirilmis_deger=8'h9f;
               8'h6f: degistirilmis_deger=8'ha8;
               8'h70: degistirilmis_deger=8'h51;
               8'h71: degistirilmis_deger=8'ha3;
               8'h72: degistirilmis_deger=8'h40;
               8'h73: degistirilmis_deger=8'h8f;
               8'h74: degistirilmis_deger=8'h92;
               8'h75: degistirilmis_deger=8'h9d;
               8'h76: degistirilmis_deger=8'h38;
               8'h77: degistirilmis_deger=8'hf5;
               8'h78: degistirilmis_deger=8'hbc;
               8'h79: degistirilmis_deger=8'hb6;
               8'h7a: degistirilmis_deger=8'hda;
               8'h7b: degistirilmis_deger=8'h21;
               8'h7c: degistirilmis_deger=8'h10;
               8'h7d: degistirilmis_deger=8'hff;
               8'h7e: degistirilmis_deger=8'hf3;
               8'h7f: degistirilmis_deger=8'hd2;
               8'h80: degistirilmis_deger=8'hcd;
               8'h81: degistirilmis_deger=8'h0c;
               8'h82: degistirilmis_deger=8'h13;
               8'h83: degistirilmis_deger=8'hec;
               8'h84: degistirilmis_deger=8'h5f;
               8'h85: degistirilmis_deger=8'h97;
               8'h86: degistirilmis_deger=8'h44;
               8'h87: degistirilmis_deger=8'h17;
               8'h88: degistirilmis_deger=8'hc4;
               8'h89: degistirilmis_deger=8'ha7;
               8'h8a: degistirilmis_deger=8'h7e;
               8'h8b: degistirilmis_deger=8'h3d;
               8'h8c: degistirilmis_deger=8'h64;
               8'h8d: degistirilmis_deger=8'h5d;
               8'h8e: degistirilmis_deger=8'h19;
               8'h8f: degistirilmis_deger=8'h73;
               8'h90: degistirilmis_deger=8'h60;
               8'h91: degistirilmis_deger=8'h81;
               8'h92: degistirilmis_deger=8'h4f;
               8'h93: degistirilmis_deger=8'hdc;
               8'h94: degistirilmis_deger=8'h22;
               8'h95: degistirilmis_deger=8'h2a;
               8'h96: degistirilmis_deger=8'h90;
               8'h97: degistirilmis_deger=8'h88;
               8'h98: degistirilmis_deger=8'h46;
               8'h99: degistirilmis_deger=8'hee;
               8'h9a: degistirilmis_deger=8'hb8;
               8'h9b: degistirilmis_deger=8'h14;
               8'h9c: degistirilmis_deger=8'hde;
               8'h9d: degistirilmis_deger=8'h5e;
               8'h9e: degistirilmis_deger=8'h0b;
               8'h9f: degistirilmis_deger=8'hdb;
               8'ha0: degistirilmis_deger=8'he0;
               8'ha1: degistirilmis_deger=8'h32;
               8'ha2: degistirilmis_deger=8'h3a;
               8'ha3: degistirilmis_deger=8'h0a;
               8'ha4: degistirilmis_deger=8'h49;
               8'ha5: degistirilmis_deger=8'h06;
               8'ha6: degistirilmis_deger=8'h24;
               8'ha7: degistirilmis_deger=8'h5c;
               8'ha8: degistirilmis_deger=8'hc2;
               8'ha9: degistirilmis_deger=8'hd3;
               8'haa: degistirilmis_deger=8'hac;
               8'hab: degistirilmis_deger=8'h62;
               8'hac: degistirilmis_deger=8'h91;
               8'had: degistirilmis_deger=8'h95;
               8'hae: degistirilmis_deger=8'he4;
               8'haf: degistirilmis_deger=8'h79;
               8'hb0: degistirilmis_deger=8'he7;
               8'hb1: degistirilmis_deger=8'hc8;
               8'hb2: degistirilmis_deger=8'h37;
               8'hb3: degistirilmis_deger=8'h6d;
               8'hb4: degistirilmis_deger=8'h8d;
               8'hb5: degistirilmis_deger=8'hd5;
               8'hb6: degistirilmis_deger=8'h4e;
               8'hb7: degistirilmis_deger=8'ha9;
               8'hb8: degistirilmis_deger=8'h6c;
               8'hb9: degistirilmis_deger=8'h56;
               8'hba: degistirilmis_deger=8'hf4;
               8'hbb: degistirilmis_deger=8'hea;
               8'hbc: degistirilmis_deger=8'h65;
               8'hbd: degistirilmis_deger=8'h7a;
               8'hbe: degistirilmis_deger=8'hae;
               8'hbf: degistirilmis_deger=8'h08;
               8'hc0: degistirilmis_deger=8'hba;
               8'hc1: degistirilmis_deger=8'h78;
               8'hc2: degistirilmis_deger=8'h25;
               8'hc3: degistirilmis_deger=8'h2e;
               8'hc4: degistirilmis_deger=8'h1c;
               8'hc5: degistirilmis_deger=8'ha6;
               8'hc6: degistirilmis_deger=8'hb4;
               8'hc7: degistirilmis_deger=8'hc6;
               8'hc8: degistirilmis_deger=8'he8;
               8'hc9: degistirilmis_deger=8'hdd;
               8'hca: degistirilmis_deger=8'h74;
               8'hcb: degistirilmis_deger=8'h1f;
               8'hcc: degistirilmis_deger=8'h4b;
               8'hcd: degistirilmis_deger=8'hbd;
               8'hce: degistirilmis_deger=8'h8b;
               8'hcf: degistirilmis_deger=8'h8a;
               8'hd0: degistirilmis_deger=8'h70;
               8'hd1: degistirilmis_deger=8'h3e;
               8'hd2: degistirilmis_deger=8'hb5;
               8'hd3: degistirilmis_deger=8'h66;
               8'hd4: degistirilmis_deger=8'h48;
               8'hd5: degistirilmis_deger=8'h03;
               8'hd6: degistirilmis_deger=8'hf6;
               8'hd7: degistirilmis_deger=8'h0e;
               8'hd8: degistirilmis_deger=8'h61;
               8'hd9: degistirilmis_deger=8'h35;
               8'hda: degistirilmis_deger=8'h57;
               8'hdb: degistirilmis_deger=8'hb9;
               8'hdc: degistirilmis_deger=8'h86;
               8'hdd: degistirilmis_deger=8'hc1;
               8'hde: degistirilmis_deger=8'h1d;
               8'hdf: degistirilmis_deger=8'h9e;
               8'he0: degistirilmis_deger=8'he1;
               8'he1: degistirilmis_deger=8'hf8;
               8'he2: degistirilmis_deger=8'h98;
               8'he3: degistirilmis_deger=8'h11;
               8'he4: degistirilmis_deger=8'h69;
               8'he5: degistirilmis_deger=8'hd9;
               8'he6: degistirilmis_deger=8'h8e;
               8'he7: degistirilmis_deger=8'h94;
               8'he8: degistirilmis_deger=8'h9b;
               8'he9: degistirilmis_deger=8'h1e;
               8'hea: degistirilmis_deger=8'h87;
               8'heb: degistirilmis_deger=8'he9;
               8'hec: degistirilmis_deger=8'hce;
               8'hed: degistirilmis_deger=8'h55;
               8'hee: degistirilmis_deger=8'h28;
               8'hef: degistirilmis_deger=8'hdf;
               8'hf0: degistirilmis_deger=8'h8c;
               8'hf1: degistirilmis_deger=8'ha1;
               8'hf2: degistirilmis_deger=8'h89;
               8'hf3: degistirilmis_deger=8'h0d;
               8'hf4: degistirilmis_deger=8'hbf;
               8'hf5: degistirilmis_deger=8'he6;
               8'hf6: degistirilmis_deger=8'h42;
               8'hf7: degistirilmis_deger=8'h68;
               8'hf8: degistirilmis_deger=8'h41;
               8'hf9: degistirilmis_deger=8'h99;
               8'hfa: degistirilmis_deger=8'h2d;
               8'hfb: degistirilmis_deger=8'h0f;
               8'hfc: degistirilmis_deger=8'hb0;
               8'hfd: degistirilmis_deger=8'h54;
               8'hfe: degistirilmis_deger=8'hbb;
               8'hff: degistirilmis_deger=8'h16;
           endcase  //rijndael degistirme case sonu
           
           case(i) //atama case baslangic
               0: cikan_kod[7:0]=degistirilmis_deger;
               1: cikan_kod[15:8]=degistirilmis_deger;
               2: cikan_kod[23:16]=degistirilmis_deger;
               3: cikan_kod[31:24]=degistirilmis_deger;
               4: cikan_kod[39:32]=degistirilmis_deger;
               5: cikan_kod[47:40]=degistirilmis_deger;
               6: cikan_kod[55:48]=degistirilmis_deger;
               7: cikan_kod[63:56]=degistirilmis_deger;
               8: cikan_kod[71:64]=degistirilmis_deger;
               9: cikan_kod[79:72]=degistirilmis_deger;
               10: cikan_kod[87:80]=degistirilmis_deger;
               11: cikan_kod[95:88]=degistirilmis_deger;
               12: cikan_kod[103:96]=degistirilmis_deger;
               13: cikan_kod[111:104]=degistirilmis_deger;
               14: cikan_kod[119:112]=degistirilmis_deger;
               15: cikan_kod[127:120]=degistirilmis_deger;
           endcase //atama case sonu
        end  //for sonu
    end  //always sonu   
    
    assign cikan_kod_w = cikan_kod;
    
endmodule
