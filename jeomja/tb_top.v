`timescale 1ns / 1ns
module tb_top; //clk, rst, G, din, brout, valid
reg [6:0] din;
reg clk, rst, G;
wire [1:6] brout;
wire valid;
//parameter N = 2;
//reg [7*N-1:0] sentence;
top DUT (clk, rst, G, din, brout, valid);


always #50 clk = ~clk;

initial begin
//sentence = "AB";
clk = 1'b1; rst = 1'b1; G = 1'b0;
#100; rst = 1'b0; G = 1'b1;
			din = "H";
#400; din = "i";
#400; din = "s";
#400; din = " ";
#400; din = "D";
#400; din = "e";
#400; din = "a";
#400; din = "t";
#400; din = "h";
#400; din = " ";
#400; din = "S";
#400; din = "e";
#400; din = "n";
#400; din = "t";
#400; din = "e";
#400; din = "n";
#400; din = "c";
#400; din = "e";
#400; din = " ";
#400; din = "c";
#400; din = "a";
#400; din = "m";
#400; din = "e";
#400; din = " ";
#400; din = "i";
#400; din = "n";
#400; din = " ";
#400; din = "t";
#400; din = "h";
#400; din = "e";
#400; din = " ";
#400; din = "s";
#400; din = "u";
#400; din = "m";
#400; din = "m";
#400; din = "e";
#400; din = "r";
#400; din = " ";
#400; din = "o";
#400; din = "f";
#400; din = " ";
#400; din = "1";
#400; din = "9";
#400; din = "8";
#400; din = "6";
#400; din = " ";
#400; din = "a";
#400; din = "n";
#400; din = "d";
#400; din = " ";
#400; din = "2";
#400; din = "0";
#400; din = "1";
#400; din = "4";
#400; din = " ";
#400; din = "L";
#400; din = "o";
#400; din = "o";
#400; din = "k";
#400; din = "i";
#400; din = "n";
#400; din = "g";
#400; din = " ";
#400; din = "b";
#400; din = "a";
#400; din = "c";
#400; din = "k";
#400; din = " ";
#400; din = "M";
#400; din = "O";
#400; din = "R";
#400; din = "R";
#400; din = "I";
#400; din = "E";
#400; din = " ";
#400; din = "k";
#400; din = "n";
#400; din = "e";
#400; din = "w";
#400; din = " ";
#400; din = "s";
#400; din = "o";
#400; din = "m";
#400; din = "e";
#400; din = "t";
#400; din = "h";
#400; din = "i";
#400; din = "n";
#400; din = "g";
#400; din = " ";
#400; din = "b";
#400; din = "a";
#400; din = "d";
#400; din = " ";
#400; din = "w";
#400; din = "a";
#400; din = "s";
#400; din = " ";
#400; din = "c";
#400; din = "o";
#400; din = "m";
#400; din = "i";
#400; din = "n";
#400; din = "g";

#5000; $stop;

end

endmodule
