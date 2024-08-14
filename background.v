module background(
    input wire clk,  // Clock input
    input wire [9:0] x,  // X coordinate input
    input wire [9:0] y,  // Y coordinate input
	 input wire [3:0] ss_front, //Spaceship Front
    input wire gunMode,  // Shooting mode input (0 or 1)
	 input wire [1:0] enType0,
	 input wire [1:0] enType1,
	 input wire [1:0] enType2,
	 input wire [1:0] enType3,
	 input wire [1:0] enType4,
	 input wire [1:0] enType5,
	 input wire [1:0] enType6,
	 input wire [1:0] enType7,
	 input wire [1:0] enType8,
	 input wire [1:0] enType9,
	 input wire [1:0] enType10,
	 input wire [1:0] enType11,
	 input wire [1:0] enType12,
	 input wire [1:0] enType13,
	 input wire [1:0] enType14,
	 input wire [1:0] enType15,
    output reg [7:0] red,  // Output for red color
    output reg [7:0] green,  // Output for green color
    output reg [7:0] blue  // Output for blue color
);
wire clk_1Hz;
clock_divider_1Hz clkForIncrease(.clk_25MHz(clk),.reset(1'b0),.clk_1Hz(clk_1Hz));
reg [2:0] trjInc [15:0];


always @(posedge clk_1Hz) begin
	if (enType0 != 2'b00) begin
		trjInc[0] = trjInc[0] + 3'b001;
	end else if (enType0 == 0) begin
		trjInc[0] = 3'b000;
	end
	if (enType1 != 2'b00) begin
		trjInc[1] = trjInc[1] + 3'b001;
	end else if (enType1 == 0) begin
		trjInc[1] = 3'b000;
	end
	if (enType2 != 2'b00) begin
		trjInc[2] = trjInc[2] + 3'b001;
	end else if (enType2 == 0) begin
		trjInc[2] = 3'b000;
	end
	if (enType3 != 2'b00) begin
		trjInc[3] = trjInc[3] + 3'b001;
	end else if (enType3 == 0) begin
		trjInc[3] = 3'b000;
	end
	if (enType4 != 2'b00) begin
		trjInc[4] = trjInc[4] + 3'b001;
	end else if (enType4 == 0) begin
		trjInc[4] = 3'b000;
	end
	if (enType5 != 2'b00) begin
		trjInc[5] = trjInc[5] + 3'b001;
	end else if (enType5 == 0) begin
		trjInc[5] = 3'b000;
	end
	if (enType6 != 2'b00) begin
		trjInc[6] = trjInc[6] + 3'b001;
	end else if (enType6 == 0) begin
		trjInc[6] = 3'b000;
	end
	if (enType7 != 2'b00) begin
		trjInc[7] = trjInc[7] + 3'b001;
	end else if (enType7 == 0) begin
		trjInc[7] = 3'b000;
	end
	if (enType8 != 2'b00) begin
		trjInc[8] = trjInc[8] + 3'b001;
	end else if (enType8 == 0) begin
		trjInc[8] = 3'b000;
	end
	if (enType9 != 2'b00) begin
		trjInc[9] = trjInc[9] + 3'b001;
	end else if (enType9 == 0) begin
		trjInc[9] = 3'b000;
	end
	if (enType10 != 2'b00) begin
		trjInc[10] = trjInc[10] + 3'b001;
	end else if (enType10 == 0) begin
		trjInc[10] = 3'b000;
	end
	if (enType11 != 2'b00) begin
		trjInc[11] = trjInc[11] + 3'b001;
	end else if (enType11 == 0) begin
		trjInc[11] = 3'b000;
	end
	if (enType12 != 2'b00) begin
		trjInc[12] = trjInc[12] + 3'b001;
	end else if (enType12 == 0) begin
		trjInc[12] = 3'b000;
	end
	if (enType13 != 2'b00) begin
		trjInc[13] = trjInc[13] + 3'b001;
	end else if (enType13 == 0) begin
		trjInc[13] = 3'b000;
	end
	if (enType14 != 2'b00) begin
		trjInc[14] = trjInc[14] + 3'b001;
	end else if (enType14 == 0) begin
		trjInc[14] = 3'b000;
	end
	if (enType15 != 2'b00) begin
		trjInc[15] = trjInc[15] + 3'b001;
	end else if (enType15 == 0) begin
		trjInc[15] = 3'b000;
	end
end

// Constants for screen resolution
parameter H_RES = 640;
parameter V_RES = 480;

// Center point
parameter CENTER_X = 320;
parameter CENTER_Y = 240;
	 
parameter SS_WIDTH = 32;
parameter SS_LENGTH = 32;

parameter GUN_WIDTH = 6;
parameter GUN_LENGTH = 6;

//DEFAULT DASHED LINES FOR TRJ
reg draw_ss =0;
reg draw_line_hv =0;
reg draw_line_angle1 = 0;
reg draw_line_angle2 = 0;
reg draw_line_angle3 = 0;
reg draw_line_angle4 = 0;
reg draw_line_angle5 = 0;
reg draw_line_angle6 = 0;

//GUN MODE TRJ DRAW
reg drawGunTrj0 = 0;
reg drawGunTrj1 = 0;
reg drawGunTrj2 = 0;
reg drawGunTrj3 = 0;
reg drawGunTrj4 = 0;
reg drawGunTrj5 = 0;
reg drawGunTrj6 = 0;
reg drawGunTrj7 = 0;
reg drawGunTrj8 = 0;
reg drawGunTrj9 = 0;
reg drawGunTrj10 = 0;
reg drawGunTrj11 = 0;
reg drawGunTrj12 = 0;
reg drawGunTrj13 = 0;
reg drawGunTrj14 = 0;
reg drawGunTrj15 = 0;


reg [15:0] gunFront;

always @(posedge clk) begin

	//CENTER SQUARE
	if ((x <= CENTER_X + SS_WIDTH/2) && (x >= CENTER_X - SS_WIDTH/2) && (y <= CENTER_Y + SS_LENGTH/2) && (y >= CENTER_Y - SS_LENGTH/2)) begin
		draw_ss = 1;
	end else begin
		draw_ss = 0;
	end
	
	//HORIZ AND VERTIC LINES
	if (x == CENTER_X || y == CENTER_Y ) begin
		draw_line_hv =1;
	end else begin
		draw_line_hv = 0;
	end
	
	//LINES W/ ANGLE
	if(x == 2 * (400 - y)) begin //22.5 degree
		draw_line_angle1  = 1;
	end else begin
		draw_line_angle1 = 0;
	end
	
	if (x == y + 80) begin  // x = -y
		draw_line_angle2 = 1;
	end else begin 
		draw_line_angle2 = 0;
	end
	
	if(2 * x ==  880 - y) begin //67.5 degree
		draw_line_angle3  = 1;
	end else begin
		draw_line_angle3 = 0;
	end
	
	if(2 * x  == y + 400) begin //112.5 degree
		draw_line_angle4  = 1;
	end else begin
		draw_line_angle4 = 0;
	end
	
	if (x == 560 - y ) begin //x = y
		draw_line_angle5 = 1;
	end else begin
		draw_line_angle5 = 0;
	end
	
	if( x  == 2 * (y - 80)) begin //157.5 degree
		draw_line_angle6  = 1;
	end else begin
		draw_line_angle6 = 0;
	end
	
	if(~gunMode) begin
		gunFront = 16'b0;
		gunFront[ss_front - 4'b0010] <= 1;
		gunFront[ss_front - 4'b0001] <= 1;
		gunFront[ss_front] <= 1;
		gunFront[ss_front + 4'b0001] <= 1;
		gunFront[ss_front + 4'b0010] <= 1;
	end else if (gunMode) begin
		gunFront = 16'b0;
		gunFront[ss_front - 4'b0001] <= 1;
		gunFront[ss_front] <= 1;
		gunFront[ss_front + 4'b0001] <= 1;
	end
	
	if((x >= 336) && (x <= 339) && (y >= 237) && (y <= 243) && (gunFront[0] == 1))begin
		drawGunTrj0 = 1;
	end else begin
		drawGunTrj0 = 0;
	end
	if((x >= 336) && (x <= 339) && (y >= 229) && (y <= 235) && (gunFront[1] == 1))begin
		drawGunTrj1 = 1;
	end else begin
		drawGunTrj1 = 0;
	end
	if((x >= 333) && (x <= 339) && (y >= 221) && (y <= 227) && (gunFront[2] == 1))begin
		drawGunTrj2 = 1;
	end else begin
		drawGunTrj2 = 0;
	end
	if((x >= 325) && (x <= 331) && (y >= 221) && (y <= 224) && (gunFront[3] == 1))begin
		drawGunTrj3 = 1;
	end else begin
		drawGunTrj3 = 0;
	end
	if((x >= 317) && (x <= 323) && (y >= 221) && (y <= 224) && (gunFront[4] == 1))begin
		drawGunTrj4 = 1;
	end else begin
		drawGunTrj4 = 0;
	end
	if((x >= 309) && (x <= 315) && (y >= 221) && (y <= 224) && (gunFront[5] == 1))begin
		drawGunTrj5 = 1;
	end else begin
		drawGunTrj5 = 0;
	end
	if((x >= 301) && (x <= 307) && (y >= 221) && (y <= 227) && (gunFront[6] == 1))begin
		drawGunTrj6 = 1;
	end else begin
		drawGunTrj6 = 0;
	end
	if((x >= 301) && (x <= 304) && (y >= 229) && (y <= 235) && (gunFront[7] == 1))begin
		drawGunTrj7 = 1;
	end else begin
		drawGunTrj7 = 0;
	end
	if((x >= 301) && (x <= 304) && (y >= 237) && (y <= 243) && (gunFront[8] == 1))begin
		drawGunTrj8 = 1;
	end else begin
		drawGunTrj8 = 0;
	end
	if((x >= 301) && (x <= 304) && (y >= 245) && (y <= 251) && (gunFront[9] == 1))begin
		drawGunTrj9 = 1;
	end else begin
		drawGunTrj9 = 0;
	end
	if((x >= 301) && (x <= 307) && (y >= 253) && (y <= 259) && (gunFront[10] == 1))begin
		drawGunTrj10 = 1;
	end else begin
		drawGunTrj10 = 0;
	end
	if((x >= 309) && (x <= 315) && (y >= 256) && (y <= 259) && (gunFront[11] == 1))begin
		drawGunTrj11 = 1;
	end else begin
		drawGunTrj11 = 0;
	end
	if((x >= 317) && (x <= 323) && (y >= 256) && (y <= 259) && (gunFront[12] == 1))begin
		drawGunTrj12 = 1;
	end else begin
		drawGunTrj12 = 0;
	end
	if((x >= 325) && (x <= 331) && (y >= 256) && (y <= 259) && (gunFront[13] == 1))begin
		drawGunTrj13 = 1;
	end else begin
		drawGunTrj13 = 0;
	end
	if((x >= 333) && (x <= 339) && (y >= 253) && (y <= 259) && (gunFront[14] == 1))begin
		drawGunTrj14 = 1;
	end else begin
		drawGunTrj14 = 0;
	end
	if((x >= 336) && (x <= 339) && (y >= 245) && (y <= 251) && (gunFront[15] == 1))begin
		drawGunTrj15 = 1;
	end else begin
		drawGunTrj15 = 0;
	end
	
	//ENEMY LOCATION ASSIGNMENT
	

// Set colors for dashed lines, and gun indicators
	if (draw_ss) begin
		red <= 8'hf5;    // pembe ss
		green <= 8'h18;
		blue <= 8'hc9;
	end else if (draw_line_hv) begin
		red <= 8'h80;    // horizontal vertical lines background (gray)
		green <= 8'h80;
		blue <= 8'h80;
	end else if (draw_line_angle1) begin
		red <= 8'h80;    //lines w/ angle1 background (gray)
		green <= 8'h80;
		blue <= 8'h80;
	end else if (draw_line_angle2) begin
		red <= 8'h80;    //lines w/ angle2 background (gray)
		green <= 8'h80;
		blue <= 8'h80;
	end else if (draw_line_angle3) begin
		red <= 8'h80;    //lines w/ angle3 background (gray)
		green <= 8'h80;
		blue <= 8'h80;
	end else if (draw_line_angle4) begin
		red <= 8'h80;    //lines w/ angle4 background (gray)
		green <= 8'h80;
		blue <= 8'h80;
	end else if (draw_line_angle5) begin
		red <= 8'h80;    //lines w/ angle5 background (gray)
		green <= 8'h80;
		blue <= 8'h80;
	end else if (draw_line_angle6) begin
		red <= 8'h80;    //lines w/ angle6 background (gray)
		green <= 8'h80;
		blue <= 8'h80;
	end else if(drawGunTrj0) begin
		red <= 8'hff;    // trj0
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj1) begin
		red <= 8'hff;    // trj1
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj2) begin
		red <= 8'hff;    // trj2
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj3) begin
		red <= 8'hff;    // trj3
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj4) begin
		red <= 8'hff;    // trj4
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj5) begin
		red <= 8'hff;    // trj5
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj6) begin
		red <= 8'hff;    // trj6
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj7) begin
		red <= 8'hff;    // trj7
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj8) begin
		red <= 8'hff;    // trj8
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj9) begin
		red <= 8'hff;    // trj9
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj10) begin
		red <= 8'hff;    // trj10
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj11) begin
		red <= 8'hff;    // trj11
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj12) begin
		red <= 8'hff;    // trj12
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj13) begin
		red <= 8'hff;    // trj13
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj14) begin
		red <= 8'hff;    // trj14
		green <= 8'h0;
		blue <= 8'h0;
	end else if(drawGunTrj15) begin
		red <= 8'hff;    // trj15
		green <= 8'h0;
		blue <= 8'h0;
//TRJ 1
	end else if((x >= 620) && (x <= 630) && (y >= 80) && (y <= 90) && trjInc[1] == 3'b001) begin
		red = (enType1 == 2'b01) ? 8'hff : 8'h0;
		green = (enType1 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType1 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 570) && (x <= 580) && (y >= 107) && (y <= 117) && trjInc[1] == 3'b010) begin
		red = (enType1 == 2'b01) ? 8'hff : 8'h0;
		green = (enType1 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType1 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 520) && (x <= 530) && (y >= 134) && (y <= 144) && trjInc[1] == 3'b011) begin
		red = (enType1 == 2'b01) ? 8'hff : 8'h0;
		green = (enType1 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType1 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 470) && (x <= 480) && (y >= 160) && (y <= 170) && trjInc[1] == 100) begin
		red = (enType1 == 2'b01) ? 8'hff : 8'h0;
		green = (enType1 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType1 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 420) && (x <= 430) && (y >= 187) && (y <= 197) && trjInc[1] == 101) begin
		red = (enType1 == 2'b01) ? 8'hff : 8'h0;
		green = (enType1 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType1 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 370) && (x <= 380) && (y >= 214) && (y <= 224) && trjInc[1] == 110) begin
		red = (enType1 == 2'b01) ? 8'hff : 8'h0;
		green = (enType1 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType1 == 2'b10) ? 8'hff : 8'h0;
	////// TRJ 2
	end else if((x >= 540) && (x <= 550) && (y >= 10) && (y <= 20) && trjInc[2] == 3'b001) begin
		red = (enType2 == 2'b01) ? 8'hff : 8'h0;
		green = (enType2 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType2 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 504) && (x <= 514) && (y >= 40) && (y <= 50) && trjInc[2] == 3'b010) begin
		red = (enType2 == 2'b01) ? 8'hff : 8'h0;
		green = (enType2 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType2 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 467) && (x <= 477) && (y >= 80) && (y <= 90) && trjInc[2] == 3'b011) begin
		red = (enType2 == 2'b01) ? 8'hff : 8'h0;
		green = (enType2 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType2 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 430) && (x <= 440) && (y >= 120) && (y <= 130) && trjInc[2] == 3'b100) begin
		red = (enType2 == 2'b01) ? 8'hff : 8'h0;
		green = (enType2 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType2 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 394) && (x <= 404) && (y >= 160) && (y <= 170) && trjInc[2] == 3'b101) begin
		red = (enType2 == 2'b01) ? 8'hff : 8'h0;
		green = (enType2 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType2 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 357) && (x <= 367) && (y >= 200) && (y <= 210) && trjInc[2] == 3'b110) begin
		red = (enType2 == 2'b01) ? 8'hff : 8'h0;
		green = (enType2 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType2 == 2'b10) ? 8'hff : 8'h0;
//TRJ 3
	end else if((x >= 420) && (x <= 430) && (y >= 10) && (y <= 20) && trjInc[3] == 3'b001) begin
		red = (enType3 == 2'b01) ? 8'hff : 8'h0;
		green = (enType3 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType3 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 404) && (x <= 414) && (y >= 40) && (y <= 50) && trjInc[3] == 3'b010) begin
		red = (enType3 == 2'b01) ? 8'hff : 8'h0;
		green = (enType3 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType3 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 387) && (x <= 397) && (y >= 80) && (y <= 90) && trjInc[3] == 3'b011) begin
		red = (enType3 == 2'b01) ? 8'hff : 8'h0;
		green = (enType3 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType3 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 370) && (x <= 380) && (y >= 120) && (y <= 130) && trjInc[3] == 3'b100) begin
		red = (enType3 == 2'b01) ? 8'hff : 8'h0;
		green = (enType3 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType3 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 354) && (x <= 364) && (y >= 160) && (y <= 170) && trjInc[3] == 3'b101) begin
		red = (enType3 == 2'b01) ? 8'hff : 8'h0;
		green = (enType3 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType3 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 337) && (x <= 347) && (y >= 200) && (y <= 210) && trjInc[3] == 3'b110) begin
		red = (enType3 == 2'b01) ? 8'hff : 8'h0;
		green = (enType3 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType3 == 2'b10) ? 8'hff : 8'h0;
//TRJ 4
	end else if((x >= 315) && (x <= 325) && (y >= 10) && (y <= 20) && trjInc[4] == 3'b001) begin
		red = (enType4 == 2'b01) ? 8'hff : 8'h0;
		green = (enType4 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType4 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 315) && (x <= 325) && (y >= 40) && (y <= 50) && trjInc[4] == 3'b010) begin
		red = (enType4 == 2'b01) ? 8'hff : 8'h0;
		green = (enType4 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType4 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 315) && (x <= 325) && (y >= 80) && (y <= 90) && trjInc[4] == 3'b011) begin
		red = (enType4 == 2'b01) ? 8'hff : 8'h0;
		green = (enType4 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType4 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 315) && (x <= 325) && (y >= 120) && (y <= 130) && trjInc[4] == 3'b100) begin
		red = (enType4 == 2'b01) ? 8'hff : 8'h0;
		green = (enType4 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType4 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 315) && (x <= 325) && (y >= 160) && (y <= 170) && trjInc[4] == 3'b101) begin
		red = (enType4 == 2'b01) ? 8'hff : 8'h0;
		green = (enType4 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType4 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 315) && (x <= 325) && (y >= 200) && (y <= 210) && trjInc[4] == 3'b110) begin
		red = (enType4 == 2'b01) ? 8'hff : 8'h0;
		green = (enType4 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType4 == 2'b10) ? 8'hff : 8'h0;
//TRJ 5
	end else if((x >= 210) && (x <= 220) && (y >= 10) && (y <= 20) && trjInc[5] == 3'b001) begin
		red = (enType5 == 2'b01) ? 8'hff : 8'h0;
		green = (enType5 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType5 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 227) && (x <= 237) && (y >= 40) && (y <= 50) && trjInc[5] == 3'b010) begin
		red = (enType5 == 2'b01) ? 8'hff : 8'h0;
		green = (enType5 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType5 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 244) && (x <= 254) && (y >= 80) && (y <= 90) && trjInc[5] == 3'b011) begin
		red = (enType5 == 2'b01) ? 8'hff : 8'h0;
		green = (enType5 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType5 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 260) && (x <= 270) && (y >= 120) && (y <= 130) && trjInc[5] == 3'b100) begin
		red = (enType5 == 2'b01) ? 8'hff : 8'h0;
		green = (enType5 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType5 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 277) && (x <= 287) && (y >= 160) && (y <= 170) && trjInc[5] == 3'b101) begin
		red = (enType5 == 2'b01) ? 8'hff : 8'h0;
		green = (enType5 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType5 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 294) && (x <= 304) && (y >= 200) && (y <= 210) && trjInc[5] == 3'b110) begin
		red = (enType5 == 2'b01) ? 8'hff : 8'h0;
		green = (enType5 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType5 == 2'b10) ? 8'hff : 8'h0;
//TRJ 6
	end else if((x >= 75) && (x <= 85) && (y >= 10) && (y <= 20) && trjInc[6] == 3'b001) begin
		red = (enType6 == 2'b01) ? 8'hff : 8'h0;
		green = (enType6 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType6 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 115) && (x <= 125) && (y >= 40) && (y <= 50) && trjInc[6] == 3'b010) begin
		red = (enType6 == 2'b01) ? 8'hff : 8'h0;
		green = (enType6 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType6 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 155) && (x <= 165) && (y >= 80) && (y <= 90) && trjInc[6] == 3'b011) begin
		red = (enType6 == 2'b01) ? 8'hff : 8'h0;
		green = (enType6 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType6 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 195) && (x <= 205) && (y >= 120) && (y <= 130) && trjInc[6] == 3'b100) begin
		red = (enType6 == 2'b01) ? 8'hff : 8'h0;
		green = (enType6 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType6 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 235) && (x <= 245) && (y >= 160) && (y <= 170) && trjInc[6] == 3'b101) begin
		red = (enType6 == 2'b01) ? 8'hff : 8'h0;
		green = (enType6 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType6 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 275) && (x <= 285) && (y >= 200) && (y <= 210) && trjInc[6] == 3'b110) begin
		red = (enType6 == 2'b01) ? 8'hff : 8'h0;
		green = (enType6 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType6 == 2'b10) ? 8'hff : 8'h0;
//TRJ 7
	end else if((x >= 10) && (x <= 20) && (y >= 75) && (y <= 85) && trjInc[7] == 3'b001) begin
		red = (enType7 == 2'b01) ? 8'hff : 8'h0;
		green = (enType7 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType7 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 54) && (x <= 64) && (y >= 102) && (y <= 112) && trjInc[7] == 3'b010) begin
		red = (enType7 == 2'b01) ? 8'hff : 8'h0;
		green = (enType7 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType7 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 107) && (x <= 117) && (y >= 129) && (y <= 139) && trjInc[7] == 3'b011) begin
		red = (enType7 == 2'b01) ? 8'hff : 8'h0;
		green = (enType7 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType7 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 160) && (x <= 170) && (y >= 155) && (y <= 165) && trjInc[7] == 3'b100) begin
		red = (enType7 == 2'b01) ? 8'hff : 8'h0;
		green = (enType7 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType7 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 214) && (x <= 224) && (y >= 182) && (y <= 192) && trjInc[7] == 3'b101) begin
		red = (enType7 == 2'b01) ? 8'hff : 8'h0;
		green = (enType7 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType7 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 267) && (x <= 277) && (y >= 209) && (y <= 219) && trjInc[7] == 3'b110) begin
		red = (enType7 == 2'b01) ? 8'hff : 8'h0;
		green = (enType7 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType7 == 2'b10) ? 8'hff : 8'h0;
//TRJ 8
	end else if((x >= 10) && (x <= 20) && (y >= 235) && (y <= 245) && trjInc[8] == 3'b001) begin
		red = (enType8 == 2'b01) ? 8'hff : 8'h0;
		green = (enType8 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType8 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 54) && (x <= 64) && (y >= 235) && (y <= 245) && trjInc[8] == 3'b010) begin
		red = (enType8 == 2'b01) ? 8'hff : 8'h0;
		green = (enType8 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType8 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 107) && (x <= 117) && (y >= 235) && (y <= 245) && trjInc[8] == 3'b011) begin
		red = (enType8 == 2'b01) ? 8'hff : 8'h0;
		green = (enType8 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType8 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 160) && (x <= 170) && (y >= 235) && (y <= 245) && trjInc[8] == 3'b100) begin
		red = (enType8 == 2'b01) ? 8'hff : 8'h0;
		green = (enType8 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType8 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 214) && (x <= 224) && (y >= 235) && (y <= 245) && trjInc[8] == 3'b101) begin
		red = (enType8 == 2'b01) ? 8'hff : 8'h0;
		green = (enType8 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType8 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 267) && (x <= 277) && (y >= 235) && (y <= 245) && trjInc[8] == 3'b110) begin
		red = (enType8 == 2'b01) ? 8'hff : 8'h0;
		green = (enType8 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType8 == 2'b10) ? 8'hff : 8'h0;
//TRJ 0	
	end else if((x >= 620) && (x <= 630) && (y >= 235) && (y <= 245) && trjInc[0] == 3'b001) begin
		red = (enType0 == 2'b01) ? 8'hff : 8'h0;
		green = (enType0 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType0 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 570) && (x <= 580) && (y >= 235) && (y <= 245) && trjInc[0] == 3'b010) begin
		red = (enType0 == 2'b01) ? 8'hff : 8'h0;
		green = (enType0 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType0 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 520) && (x <= 530) && (y >= 235) && (y <= 245) && trjInc[0] == 3'b011) begin
		red = (enType0 == 2'b01) ? 8'hff : 8'h0;
		green = (enType0 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType0 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 470) && (x <= 480) && (y >= 235) && (y <= 245) && trjInc[0] == 3'b100) begin
		red = (enType0 == 2'b01) ? 8'hff : 8'h0;
		green = (enType0 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType0 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 420) && (x <= 430) && (y >= 235) && (y <= 245) && trjInc[0] == 3'b101) begin
		red = (enType0 == 2'b01) ? 8'hff : 8'h0;
		green = (enType0 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType0 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 370) && (x <= 380) && (y >= 235) && (y <= 245) && trjInc[0] == 3'b110) begin
		red = (enType0 == 2'b01) ? 8'hff : 8'h0;
		green = (enType0 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType0 == 2'b10) ? 8'hff : 8'h0;
//TRJ 9
	end else if((x >= 10) && (x <= 20) && (y >= 400) && (y <= 410) && trjInc[9] == 3'b001) begin
		red = (enType9 == 2'b01) ? 8'hff : 8'h0;
		green = (enType9 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType9 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 54) && (x <= 64) && (y >= 374) && (y <= 384) && trjInc[9] == 3'b010) begin
		red = (enType9 == 2'b01) ? 8'hff : 8'h0;
		green = (enType9 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType9 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 107) && (x <= 117) && (y >= 347) && (y <= 357) && trjInc[9] == 3'b011) begin
		red = (enType9 == 2'b01) ? 8'hff : 8'h0;
		green = (enType9 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType9 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 160) && (x <= 170) && (y >= 320) && (y <= 330) && trjInc[9] == 3'b100) begin
		red = (enType9 == 2'b01) ? 8'hff : 8'h0;
		green = (enType9 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType9 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 214) && (x <= 224) && (y >= 294) && (y <= 304) && trjInc[9] == 3'b101) begin
		red = (enType9 == 2'b01) ? 8'hff : 8'h0;
		green = (enType9 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType9 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 267) && (x <= 277) && (y >= 267) && (y <= 277) && trjInc[9] == 3'b110) begin
		red = (enType9 == 2'b01) ? 8'hff : 8'h0;
		green = (enType9 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType9 == 2'b10) ? 8'hff : 8'h0;
//TRJ 10
	end else if((x >= 10) && (x <= 20) && (y >= 460) && (y <= 470) && trjInc[10] == 3'b001) begin
		red = (enType10 == 2'b01) ? 8'hff : 8'h0;
		green = (enType10 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType10 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 54) && (x <= 64) && (y >= 420) && (y <= 430) && trjInc[10] == 3'b010) begin
		red = (enType10 == 2'b01) ? 8'hff : 8'h0;
		green = (enType10 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType10 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 107) && (x <= 117) && (y >= 380) && (y <= 390) && trjInc[10] == 3'b011) begin
		red = (enType10 == 2'b01) ? 8'hff : 8'h0;
		green = (enType10 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType10 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 160) && (x <= 170) && (y >= 340) && (y <= 350) && trjInc[10] == 3'b100) begin
		red = (enType10 == 2'b01) ? 8'hff : 8'h0;
		green = (enType10 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType10 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 214) && (x <= 224) && (y >= 300) && (y <= 310) && trjInc[10] == 3'b101) begin
		red = (enType10 == 2'b01) ? 8'hff : 8'h0;
		green = (enType10 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType10 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 267) && (x <= 277) && (y >= 260) && (y <= 270) && trjInc[10] == 3'b110) begin
		red = (enType10 == 2'b01) ? 8'hff : 8'h0;
		green = (enType10 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType10 == 2'b10) ? 8'hff : 8'h0;
	//TRJ 11
	end else if((x >= 210) && (x <= 220) && (y >= 460) && (y <= 470) && trjInc[11] == 3'b001) begin
		red = (enType11 == 2'b01) ? 8'hff : 8'h0;
		green = (enType11 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType11 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 227) && (x <= 237) && (y >= 420) && (y <= 430) && trjInc[11] == 3'b010) begin
		red = (enType11 == 2'b01) ? 8'hff : 8'h0;
		green = (enType11 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType11 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 244) && (x <= 254) && (y >= 380) && (y <= 390) && trjInc[11] == 3'b011) begin
		red = (enType11 == 2'b01) ? 8'hff : 8'h0;
		green = (enType11 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType11 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 260) && (x <= 270) && (y >= 340) && (y <= 350) && trjInc[11] == 3'b100) begin
		red = (enType11 == 2'b01) ? 8'hff : 8'h0;
		green = (enType11 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType11 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 277) && (x <= 287) && (y >= 300) && (y <= 310) && trjInc[11] == 3'b101) begin
		red = (enType11 == 2'b01) ? 8'hff : 8'h0;
		green = (enType11 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType11 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 294) && (x <= 304) && (y >= 260) && (y <= 270) && trjInc[11] == 3'b110) begin
		red = (enType11 == 2'b01) ? 8'hff : 8'h0;
		green = (enType11 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType11 == 2'b10) ? 8'hff : 8'h0;
//TRJ 12
	end else if((x >= 315) && (x <= 325) && (y >= 460) && (y <= 470) && trjInc[12] == 3'b001) begin
		red = (enType12 == 2'b01) ? 8'hff : 8'h0;
		green = (enType12 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType12 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 315) && (x <= 325) && (y >= 420) && (y <= 430) && trjInc[12] == 3'b010) begin
		red = (enType12 == 2'b01) ? 8'hff : 8'h0;
		green = (enType12 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType12 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 315) && (x <= 325) && (y >= 380) && (y <= 390) && trjInc[12] == 3'b011) begin
		red = (enType12 == 2'b01) ? 8'hff : 8'h0;
		green = (enType12 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType12 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 315) && (x <= 325) && (y >= 340) && (y <= 350) && trjInc[12] == 3'b100) begin
		red = (enType12 == 2'b01) ? 8'hff : 8'h0;
		green = (enType12 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType12 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 315) && (x <= 325) && (y >= 300) && (y <= 310) && trjInc[12] == 3'b101) begin
		red = (enType12 == 2'b01) ? 8'hff : 8'h0;
		green = (enType12 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType12 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 315) && (x <= 325) && (y >= 260) && (y <= 270) && trjInc[12] == 3'b110) begin
		red = (enType12 == 2'b01) ? 8'hff : 8'h0;
		green = (enType12 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType12 == 2'b10) ? 8'hff : 8'h0;
//TRJ 13
	end else if((x >= 420) && (x <= 430) && (y >= 460) && (y <= 470) && trjInc[13] == 3'b001) begin
		red = (enType13 == 2'b01) ? 8'hff : 8'h0;
		green = (enType13 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType13 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 404) && (x <= 414) && (y >= 420) && (y <= 430) && trjInc[13] == 3'b010) begin
		red = (enType13 == 2'b01) ? 8'hff : 8'h0;
		green = (enType13 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType13 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 387) && (x <= 397) && (y >= 380) && (y <= 390) && trjInc[13] == 3'b011) begin
		red = (enType13 == 2'b01) ? 8'hff : 8'h0;
		green = (enType13 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType13 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 370) && (x <= 380) && (y >= 340) && (y <= 350) && trjInc[13] == 3'b100) begin
		red = (enType13 == 2'b01) ? 8'hff : 8'h0;
		green = (enType13 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType13 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 354) && (x <= 364) && (y >= 300) && (y <= 310) && trjInc[13] == 3'b101) begin
		red = (enType13 == 2'b01) ? 8'hff : 8'h0;
		green = (enType13 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType13 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 337) && (x <= 347) && (y >= 260) && (y <= 270) && trjInc[13] == 3'b110) begin
		red = (enType13 == 2'b01) ? 8'hff : 8'h0;
		green = (enType13 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType13 == 2'b10) ? 8'hff : 8'h0;
//TRJ 14
	end else if((x >= 540) && (x <= 550) && (y >= 460) && (y <= 470) && trjInc[14] == 3'b001) begin
		red = (enType14 == 2'b01) ? 8'hff : 8'h0;
		green = (enType14 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType14 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 504) && (x <= 514) && (y >= 420) && (y <= 430) && trjInc[14] == 3'b010) begin
		red = (enType14 == 2'b01) ? 8'hff : 8'h0;
		green = (enType14 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType14 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 467) && (x <= 477) && (y >= 380) && (y <= 390) && trjInc[14] == 3'b011) begin
		red = (enType14 == 2'b01) ? 8'hff : 8'h0;
		green = (enType14 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType14 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 430) && (x <= 440) && (y >= 340) && (y <= 350) && trjInc[14] == 3'b100) begin
		red = (enType14 == 2'b01) ? 8'hff : 8'h0;
		green = (enType14 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType14 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 394) && (x <= 404) && (y >= 300) && (y <= 310) && trjInc[14] == 3'b101) begin
		red = (enType14 == 2'b01) ? 8'hff : 8'h0;
		green = (enType14 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType14 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 357) && (x <= 367) && (y >= 260) && (y <= 270) && trjInc[14] == 3'b110) begin
		red = (enType14 == 2'b01) ? 8'hff : 8'h0;
		green = (enType14 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType14 == 2'b10) ? 8'hff : 8'h0;
//TRJ 15
	end else if((x >= 610) && (x <= 620) && (y >= 390) && (y <= 400) && trjInc[15] == 3'b001) begin
		red = (enType15 == 2'b01) ? 8'hff : 8'h0;
		green = (enType15 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType15 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 560) && (x <= 570) && (y >= 364) && (y <= 374) && trjInc[15] == 3'b010) begin
		red = (enType15 == 2'b01) ? 8'hff : 8'h0;
		green = (enType15 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType15 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 510) && (x <= 520) && (y >= 337) && (y <= 347) && trjInc[15] == 3'b011) begin
		red = (enType15 == 2'b01) ? 8'hff : 8'h0;
		green = (enType15 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType15 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 460) && (x <= 470) && (y >= 310) && (y <= 320) && trjInc[15] == 3'b100) begin
		red = (enType15 == 2'b01) ? 8'hff : 8'h0;
		green = (enType15 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType15 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 410) && (x <= 420) && (y >= 284) && (y <= 294) && trjInc[15] == 3'b101) begin
		red = (enType15 == 2'b01) ? 8'hff : 8'h0;
		green = (enType15 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType15 == 2'b10) ? 8'hff : 8'h0;
	end else if((x >= 360) && (x <= 370) && (y >= 257) && (y <= 267) && trjInc[15] == 3'b110) begin
		red = (enType15 == 2'b01) ? 8'hff : 8'h0;
		green = (enType15 == 2'b11) ? 8'hff : 8'h0;
		blue = (enType15 == 2'b10) ? 8'hff : 8'h0;
	end else if( (trjInc[0] == 7) || (trjInc[1] == 7) || (trjInc[2] == 7) || (trjInc[3] == 7) || (trjInc[4] == 7) || (trjInc[5] == 7) || (trjInc[6] == 7) || (trjInc[7] == 7) || (trjInc[8] == 7) || (trjInc[9] == 7) || (trjInc[10] == 7) || (trjInc[11] == 7) || (trjInc[12] == 7) || (trjInc[13] == 7) || (trjInc[14] == 7) || (trjInc[15] == 7)) begin
		red <= 8'h0;    // dead background
		green <= 8'h0;
		blue <= 8'h0;
	end else begin
		red <= 8'hff;    // white background
		green <= 8'hff;
		blue <= 8'hff;
	end	
end

endmodule
