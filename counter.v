`timescale 1ns / 1ps
module counter(input clk,output reg[1:0] sel);
always @(posedge clk) begin
    if (sel == 2'b11) begin
        sel = 0;
    end
    else begin
        sel = sel + 1;
    end
end
endmodule
