module cont (clk, rst, G, A, b5, load, scsel, valid, outiterinc); // load capital sign, load numbersign, load spacesign, load braille
input clk, b5, rst, G;
input [7:0] A;
//input [2:0] hra; //high rank bits A
output reg [1:0] scsel;
output reg load;
output reg valid;
output reg outiterinc;
wire [2:0] hra;
assign hra = A[6:4];

parameter IDLE = 3'b000, LOAD = 3'b001, CSO = 3'b010, NSO = 3'b011, SSO = 3'b100, BRO = 3'b101, DEL = 3'b110;

//reg [1:0] scnt, spcnt; // statecnt, special cnt
reg spcnt, scnt;
wire szero, spzero;
reg decsz, decspz;
reg sen, spcen;
assign szero = !scnt; // state cnt is zero => 1
assign spzero = !spcnt; // special cnt is zero => 1

reg cscplt, numcplt; // capital sign complete, numbersign complete

wire cap, num, space;
wire [2:0] mode;
reg tmode;
reg dcs; // double capital sign
assign cap = hra[2] & !hra[1]; // if input is a capital letter => 1
assign num = !hra[2] & hra[0]; // if input in a number => 1
assign space = !hra[2] & !hra[0]; // if input is a blank => 1
assign mode = {cap & cscplt, num & numcplt, space};
wire cc;
assign cc = cap & !b5;

reg [2:0] ps, ns;

always @ (posedge clk or posedge rst) begin // seq logic
	if(rst)
		ps <= 3'b0;
	else
		ps <= ns;
end // end of seq

always @ (posedge clk) begin // spcnt
	if (spcen)
		spcnt <= cc;//((b5 + cap)&{2{cap}}) + num - 2'b1;
	else if(decspz)
		spcnt <= spcnt - 1'b1;
end

always @ (posedge clk) begin // scnt
	if (sen)
		scnt <= tmode;//~|tmode | cap | cscplt;//((b5 + cap)&{2{cap}}) + num - 2'b1;
	else if(decsz)
		scnt <= scnt - 1'b1;
end

always @ (*) begin //(ps, G, szero, spzero, hra, b5) begin
	load = 1'b0; scsel = 2'b11; decspz = 1'b0; decsz = 1'b0; spcen = 1'b0; sen = 1'b0;
	valid = 1'b1; outiterinc = 1'b1;
	
	case(ps)
		IDLE : begin cscplt = 1'b1; numcplt = 1'b1; valid = 1'b0; outiterinc = 1'b0;
					 if(G) begin
					 	ns = LOAD; 
						load = 1'b1; end
					 else
					 	ns = IDLE; end

		LOAD : begin 
					 if(~^A) begin
					 	case(mode)
							3'b100 : ns = CSO;
							3'b010 : ns = NSO;
							3'b001 : ns = SSO;
							default : ns = BRO; // have to review		 
					  endcase end
						else
							ns = IDLE;
						tmode = ~mode[2] & ~mode[1] | mode[0];//mode[1] | !mode[0];//mode[2] | mode[1] | !mode[0];
						dcs = cc & mode[2];
						valid = 1'b0;
						sen = 1'b1;
						spcen = 1'b1; end
		CSO : begin
					numcplt = 1'b1;
					cscplt = 1'b0;
					scsel = 2'b10;
					decspz = 1'b1;
					if(spzero) ns = BRO;
					else ns = CSO; end
		NSO : begin
					numcplt = 1'b0;
					cscplt = 1'b1;
					scsel = 2'b01;
					ns = BRO; end
					//decspz = 1'b1;
					//if(spzero) ns = BRO;
					//else ns = NSO; end
		SSO : begin
					numcplt = 1'b1;
					cscplt = 1'b1;
					scsel = 2'b11;
					ns = DEL; end
		BRO : begin
					scsel = 2'b00;
					//decsz = 1'b1;
					//ns = LOAD;
					//load = 1'b1; end	
					if(dcs) begin ns = LOAD; load = 1'b1; end
					else ns = DEL; end
		DEL : begin
					valid = 1'b0;
					decsz = 1'b1;
					if(szero) begin ns = LOAD; load = 1'b1; end
					else ns = DEL; end
		default : ns = IDLE; // have to review
	endcase
end




endmodule

