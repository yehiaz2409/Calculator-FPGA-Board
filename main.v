`timescale 1ns / 1ps


module main(input B1,B2,B3,B4,B5,B6,B7,B8,B9,clk_in,reset, output reg[6:0] seg, output reg[3:0] anode, output reg dp);
reg[3:0]digit1, digit2, digit3, digit4;
wire[3:0]Adigit1, Adigit2, Adigit3, Adigit4;
wire[3:0]Sdigit1, Sdigit2, Sdigit3, Sdigit4;
wire[3:0]Mdigit1, Mdigit2, Mdigit3, Mdigit4;
wire[3:0]Ddigit1, Ddigit2, Ddigit3, Ddigit4;
wire[3:0]Odigit1, Odigit2, Odigit3, Odigit4;
wire clk_out;
wire [1:0] sel;
clockdivider #(50000)myclk(.clk(clk_in),.rst(reset),.clk_out(clk_out));
counter mycount(clk_out,sel);
always @(sel) begin
case(sel)
            2'b00 : anode = 4'b1110;
            2'b01 : anode = 4'b1101;
            2'b10 : anode = 4'b1011;
            2'b11 : anode = 4'b0111;
       endcase
end
always @(sel) begin
case(sel)
0 : dp = 1;
1 : dp = 1;
2 : dp = 0;
3 : dp = 1;
endcase
end
//wire negative;
//assign negative = 0;
wire [3:0]ogfirst, ogsecond, ogthird, ogfourth;
wire [6:0] seg1,seg2,seg3,seg4;

decoder d1(clk_out,digit4,seg1);
decoder d2(clk_out,digit3,seg2);
decoder d3(clk_out,digit2,seg3);
decoder d4(clk_out,digit1,seg4);
//reg [3:0]first, second, third, fourth;

//Seven Segment Display
always@(*)begin
    case(sel)
    0: seg = seg1;
    1: seg = seg2;
    2: seg = seg3;
    3: seg = seg4;
    endcase
end

DigitGenerator di1(B1, reset, ogfirst);
DigitGenerator di2(B2, reset, ogsecond);
DigitGenerator di3(B3, reset, ogthird);
DigitGenerator di4(B4, reset, ogfourth);


Addition adder(B5,reset,ogfirst,ogsecond,ogthird,ogfourth,Adigit1,Adigit2,Adigit3,Adigit4);
subtract subtractor(B6,reset,ogfirst,ogsecond,ogthird,ogfourth,Sdigit1,Sdigit2,Sdigit3,Sdigit4);
multiply multiplier(B7,reset,ogfirst,ogsecond,ogthird,ogfourth,Mdigit1,Mdigit2,Mdigit3,Mdigit4);
division divider(B8,reset,ogfirst,ogsecond,ogthird,ogfourth,Ddigit1,Ddigit2,Ddigit3,Ddigit4);
orignum o1(B9,reset,ogfirst,ogsecond,ogthird,ogfourth,Odigit1,Odigit2,Odigit3,Odigit4);

always@(posedge B1, posedge B2,posedge B3,posedge B4,posedge B5, posedge B6, posedge B7,posedge B8, posedge B9)begin
    if(B1) begin
        digit1 = ogfirst;
        digit2 = ogsecond;
        digit3 = ogthird;
        digit4 = ogfourth;
    end
    else if(B2)begin
         digit1 = ogfirst;
         digit2 = ogsecond;
         digit3 = ogthird;
         digit4 = ogfourth;
    end
    else if(B3)begin
         digit1 = ogfirst;
         digit2 = ogsecond;
         digit3 = ogthird;
         digit4 = ogfourth;
    end
    else if(B4)begin
          digit1 = ogfirst;
          digit2 = ogsecond;
          digit3 = ogthird;
          digit4 = ogfourth;
    end
    else if(B5)begin
        digit1 = Adigit1;
        digit2 = Adigit2;
        digit3 = Adigit3;
        digit4 = Adigit4;
    end
    else if(B6) begin
            digit1 = Sdigit1;
            digit2 = Sdigit2;
            digit3 = Sdigit3;
            digit4 = Sdigit4;
    end
    else if(B7) begin
            digit1 = Mdigit1;
            digit2 = Mdigit2;
            digit3 = Mdigit3;
            digit4 = Mdigit4;
    end
    else if(B8) begin
            digit1 = Ddigit1;
            digit2 = Ddigit2;
            digit3 = Ddigit3;
            digit4 = Ddigit4;
    end
    else if(B9) begin
            digit1 = Odigit1;
            digit2 = Odigit2;
            digit3 = Odigit3;
            digit4 = Odigit4;
    end
//    else if(reset) begin
//            digit1 = 0;
//            digit2 = 0;
//            digit3 = 0;
//            digit4 = 0;
//    end
    else begin
        digit1 = digit1;
        digit2 = digit2;
        digit3 = digit3;
        digit4 = digit4;
    end
end



endmodule