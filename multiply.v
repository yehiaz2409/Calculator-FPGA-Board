`timescale 1ns / 1ps


module multiply(
input button, input reset,
input[3:0] first, second, third, fourth,
output reg[3:0] digit1, output reg[3:0] digit2, output reg[3:0] digit3,
output reg[3:0] digit4
    );
        reg [6:0] num1, num2;
        reg [13:0] multiplication;
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
                multiplication = num1 * num2;
                digit4 = multiplication % 10;
                multiplication = multiplication/10;
                digit3 = multiplication%10;
                multiplication = multiplication/10;
                digit2 = multiplication%10;
                multiplication = multiplication/10;
                digit1 = multiplication%10;
            end
        end
        end
endmodule
