`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:29:46 AM
// Design Name: 
// Module Name: Addition
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


module Addition(
input button, input reset,
input[3:0] first, second, third, fourth,
output [3:0] digit1, output reg[3:0] digit2, output reg[3:0] digit3,
output reg[3:0] digit4
    );
    reg [6:0] num1, num2;
    reg [13:0] addition;
    assign digit1 = 0;
    always @(posedge button, posedge reset)begin
        if(reset)begin
            addition = 0;
//            digit1 = 0;
            digit2 = 0;
            digit3 = 0;
            digit4 = 0;
            num1 = 0;
            num2 = 0;
        end
        else begin
            if(button)begin
                num1 = first *10 + second;
                num2 = third *10 + fourth;
                addition = num1 + num2;
//                digit1 = 0;
                digit4 = addition % 10;
                addition = addition/10;
                digit3 = addition%10;
                addition = addition/10;
                digit2 = addition%10;
            end
            else begin
                num1 = num1;
                num2 = num2;
                addition = addition;
//                digit1 = digit1;
                digit2 = digit2;
                digit3 = digit3; 
                digit4 = digit4; 
            end
        
        end    
    end
endmodule
