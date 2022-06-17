`timescale 1ns / 1ps


module subtract(
input button, input reset,
input[3:0] first, second, third, fourth,
output reg[3:0] digit1, output reg[3:0] digit2, output reg[3:0] digit3,
output reg[3:0] digit4
    );
    reg [6:0] num1, num2;
    reg [8:0] subtraction;
    always @(posedge reset, posedge button) begin
        if(reset) begin
            digit1 = 0;
            digit2 = 0;
            digit3 = 0;
            digit4 = 0;
        end
        else begin
            if(button)begin
                 num1 = first*10 + second;
               num2 = third*10 + fourth;
               if (num1 > num2 | num2 == num1) begin
                  subtraction = num1-num2; 
                  digit1 = 0;
                  digit4 = subtraction % 10;
                  subtraction = subtraction/10;
                  digit3 = subtraction%10;
                  subtraction = subtraction/10;
                  digit2 = subtraction%10;
               end
               else begin
                   
                  subtraction = num2 - num1;
                  digit1 = 10;
                  digit4 = subtraction % 10;
                  subtraction = subtraction/10;
                  digit3 = subtraction%10;
                  subtraction = subtraction/10;
                  digit2 = subtraction%10;
               end
            end
        end
    end
endmodule
