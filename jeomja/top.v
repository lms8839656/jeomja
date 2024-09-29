module top(clk, rst, G, din, sout, valid);
input clk, rst, G;
input [6:0] din;
output valid;
output [1:6] sout;

wire load, capital; // capital may not used
wire [1:0] scsel;
wire [2:0] hra;
wire b5;
wire parity;
wire outiterinc;
wire [1:6] brout;
reg [6:0] A, B;

assign hra = A[6:4];
assign b5 = B[5];
assign parity = ^A; // parity generater parity ok => 1
wire [1:6] sout; // temp
cont C0 (clk, rst, G, {parity, A}, b5, load, scsel, valid, outiterinc); // load capital sign, load numbersign, load spacesign, load braille
AsToBr D0 (A, scsel, capital, brout); // ec : english constant  sc : special char capital don't need
//have to modify data length like in this
tempsave T0 (clk, rst, valid, outiterinc, brout, sout); // initerinc = load

always @ (posedge clk or posedge rst) begin // regA
	if(rst) 
		A <= 8'b0;
	else if(load)
		A <= B;
end

always @ (posedge clk or posedge rst) begin // regB
	if(rst) 
		B <= 8'b0;
	else if(load)
		B <= din;
end


endmodule
