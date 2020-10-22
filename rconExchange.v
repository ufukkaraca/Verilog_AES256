`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2020 13:22:41
// Design Name: 
// Module Name: rconExchange
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


module rconExchange(
        input [3:0] rc_in,
        output reg[31:0]rc_out
    );
    
    
    always@*begin
        case(rc_in)	
             4'h0: rc_out=32'h01_00_00_00;
             4'h1: rc_out=32'h02_00_00_00;
             4'h2: rc_out=32'h04_00_00_00;
             4'h3: rc_out=32'h08_00_00_00;
             4'h4: rc_out=32'h10_00_00_00;
             4'h5: rc_out=32'h20_00_00_00;
             4'h6: rc_out=32'h40_00_00_00;
             4'h7: rc_out=32'h80_00_00_00;
             4'h8: rc_out=32'h1b_00_00_00;
             4'h9: rc_out=32'h36_00_00_00;
           endcase
    end
    
endmodule
