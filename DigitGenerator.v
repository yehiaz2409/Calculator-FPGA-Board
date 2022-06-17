`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:21:53 AM
// Design Name: 
// Module Name: DigitGenerator
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


module DigitGenerator(
input button, input reset,
output [3:0]out
    );
    reg [3:0] number;
    always@(posedge button, posedge reset)
    begin
        if(reset)
            number = 0;
        else
        begin
            if(button)begin 
                number = number + 1;
                if(number >= 10)begin
                    number = 0;
                end
            end
            else
                number = number;
        end
    end
    assign out = number;
endmodule
