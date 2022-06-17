`timescale 1ns / 1ps


module division(
input button, input reset,
input[3:0] first, second, third, fourth,
output reg[3:0] digit1, output reg[3:0] digit2, output reg[3:0] digit3,
output reg[3:0] digit4
    );
     reg [6:0] num1, num2;
     reg [6:0] division;
     always @(posedge reset, posedge button) begin
            if(reset)begin
                digit1 = 0;
                digit2 = 0;
                digit3 = 0;
                digit4 = 0;
            end
            else begin
                if(button) begin
                    num1 = first*10 + second;
                    num2 = third*10 + fourth;
                    if (num1 == 0) begin
                        division = 0;
                    end
                    else begin
                        division = num1/num2;
                        digit1 = 0;
                        digit2 = 0;
                        digit4 = division % 10;
                        division = division/10;
                        digit3 = division%10;
                    end
                end
            end
            end
endmodule
