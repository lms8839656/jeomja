module tempsave (clk, rst, initerinc, outiterinc, brin, out); // initerinc = load
input clk, rst, initerinc, outiterinc;//, load;
input [5:0] brin;

output [5:0] out;
reg [5:0] out;

reg [3:0] initer, outiter;
reg [5:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10;
reg [1:0] dclk;
wire rsta;
assign rsta = initer == 4'b1011 ? 1'b1 : 1'b0;
always @ (posedge clk or posedge rst or posedge rsta) begin // cnt 0~9
	if(rst | rsta)
		initer <= 4'b0;
//	else if (initer == 4'b1010)
//		initer <= 4'b0;
	else if (initerinc)
		initer <= initer + 4'b1;
end

always @ (posedge clk or posedge rst) begin
	if(rst)
		dclk <= 2'b0;
	else
		dclk <= dclk + 2'b1;
end

always @ (posedge dclk[1] or posedge rst) begin // cnt 0~9
	if(rst)
		outiter <= 4'b1001;
	else if (outiter == 4'b1010)
		outiter <= 4'b0;
	else if (outiterinc)
		outiter <= outiter + 4'b1;
end

always @ (posedge clk or posedge rst) begin
	if(rst) begin
		R0 <= 6'b0;
		R1 <= 6'b0;
		R2 <= 6'b0;
		R3 <= 6'b0;
		R4 <= 6'b0;
		R5 <= 6'b0;
		R6 <= 6'b0;
		R7 <= 6'b0;
		R8 <= 6'b0;
		R9 <= 6'b0; 
		R10 <= 6'b0; end
	else if(initerinc) begin // load was
		case (initer)
			4'd0 : R0 <= brin;
			4'd1 : R1 <= brin;
			4'd2 : R2 <= brin;
			4'd3 : R3 <= brin;
			4'd4 : R4 <= brin;
			4'd5 : R5 <= brin;
			4'd6 : R6 <= brin;
			4'd7 : R7 <= brin;
			4'd8 : R8 <= brin;
			4'd9 : R9 <= brin;
			4'd10 : R10 <= brin;
		endcase end
end

always @ (*) begin
	case(outiter)
			4'd0 : out = R0;
			4'd1 : out = R1;
			4'd2 : out = R2;
			4'd3 : out = R3;
			4'd4 : out = R4;
			4'd5 : out = R5;
			4'd6 : out = R6;
			4'd7 : out = R7;
			4'd8 : out = R8;
			4'd9 : out = R9;
			4'd10 : out = R10;
			default : out = R0;
	endcase
end

endmodule 