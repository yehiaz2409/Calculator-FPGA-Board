`timescale 1ns / 1ps


module orignum(
input button, input reset,
input[3:0] first, second, third, fourth,
output reg[3:0] digit1, output reg[3:0] digit2, output reg[3:0] digit3,
output reg[3:0] digit4
    );
    always @(posedge reset, posedge button) begin
                if(reset)begin
                    digit1 = 0;
                    digit2 = 0;
                    digit3 = 0;
                    digit4 = 0;
                end
                else begin
                   digit1 = first;
                   digit2 = second;
                   digit3 = third;
                   digit4 = fourth;
                end
                end
endmodule
