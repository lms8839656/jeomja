module AsToBr (in, scsel, capital, brout); // ec : english constant  sc : special char
input [6:0] in;
input [1:0] scsel;
output capital;
output reg [1:6] brout;

//reg [5:0] charout;
//wire [5:0] consout;
reg [4:0] tin; // inside signal
reg [5:0] mask;
reg [5:0] temp;
reg [1:6] out;
//assign out = ecsel ? consout : charout;
//assign out = charout;

assign capital = in[5] ? 1'b0 : 1'b1;

always @ (*) begin
	//about char out 
	tin = in[4:0];
	tin[4] = in[6] & in[4]; // num to char
	if(tin[4:0] >= 5'b10111) begin
		mask = 6'b000000;
		//tin = 5'b00000;
		temp = 5'b00000;
		case(tin[4:0])
			5'b10111 : out = 6'b111010; // w
			5'b11000 : out = 6'b101101; // x
			5'b11001 : out = 6'b111101; // y
			5'b11010 : out = 6'b011101; // z
			default : out = 6'b111111;
		endcase
	end // end of wxyz
	else begin // have to insert end
		//tin = in[4:0] & {in[6], 4'b1};
		if(tin[4:0] > 5'b10100) begin
			mask = 6'b001001;
			tin = tin - 5'b10100; end
		else if (tin[4:0] > 5'b01010) begin
			mask = 6'b000001;
			tin = tin - 5'b01010; end
		else begin
			mask = 6'b000000; end
		case (tin)
			5'b00001 : temp = 6'b000100; //a-k-u
			5'b00010 : temp = 6'b000110; //b-l-v
			5'b00011 : temp = 6'b100100; //c-m
			5'b00100 : temp = 6'b110100; //d-n
			5'b00101 : temp = 6'b010100; //e-o
			5'b00110 : temp = 6'b100110; //f-p
			5'b00111 : temp = 6'b110110; //g-q
			5'b01000 : temp = 6'b010110; //h-r
			5'b01001 : temp = 6'b100010; //i-s
			5'b01010 : temp = 6'b110010; //j-t
			default : temp = 6'b110010; // for number 0
		endcase
		out = temp | mask;
		end // end of number and not wxzy
	end // end of always
//assign consout = temp;

always @ (*) begin // mux
	case(scsel)
		2'b00 : brout = out;
		2'b01 : brout = 6'b111001; // numbersign
		2'b10 : brout = 6'b001000;
		2'b11 : brout = 6'b000000; // have to review
		default : brout = out;
	endcase
end


endmodule
