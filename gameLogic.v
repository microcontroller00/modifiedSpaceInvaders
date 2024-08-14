module gameLogic(
	input wire clk,
	input wire reset,
	
	input wire clk_reset,
	
	input wire btnR,
	input wire btnL,
	input wire btnFire,
	input wire SWmode,
	

	output wire [1:0] e_life0,
	output wire [1:0] e_life1,
	output wire [1:0] e_life2,
	output wire [1:0] e_life3,
	output wire [1:0] e_life4,
	output wire [1:0] e_life5,
	output wire [1:0] e_life6,
	output wire [1:0] e_life7,
	output wire [1:0] e_life8,
	output wire [1:0] e_life9,
	output wire [1:0] e_life10,
	output wire [1:0] e_life11,
	output wire [1:0] e_life12,
	output wire [1:0] e_life13,
	output wire [1:0] e_life14,
	output wire [1:0] e_life15,

	output wire [7:0] scoreOut,
	output wire [3:0] ss_frontOut
);
///////////////////////////////////////////////////////////////////////////////////

//ENEMY NUMBER COUNTER

reg [3:0] count;
integer m;
always @(posedge clk) begin
	count = 4'b0000;
	for (m = 0; m < 16; m = m + 1) begin
		if (enemy_trajectory_wire[m] != 4'b0000) begin
			count = count + 4'b0001;
		end
	end
end

wire [3:0] enemy_number;
assign enemy_number = count;
//assign enemyNumOut = count;

//END OF THE ENEMY NUMBER COUNTER

///////////////////////////////////////////////////////////////////////////////////

//BUTTON ASSIGNMENT

reg [3:0] ss_front;
reg Gun_mode;

always @(posedge clk) begin
	if (~btnL && btnR) begin
      ss_front <= ss_front + 1;
   end else if (~btnR && btnL) begin
		ss_front <= ss_front - 1;
	end
end

wire [3:0] ss_front_wire;
assign ss_front_wire = ss_front;
assign ss_frontOut = ss_front;

//END OF THE BUTTON ASSIGNMENT AND FIRING MODULE

///////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////

//ENEMY TARJECTORY AND LIFE ASSIGMENT

reg [7:0] score;
integer i;
integer h;
integer j;
reg [3:0] enemy_trajectory [15:0];
reg [1:0] enemy_life [15:0];

wire [3:0] new_enemy_trajectory [3:0];
wire [1:0] new_enemy_lives [3:0];

assign new_enemy_trajectory[0] = random_trj0;
assign new_enemy_trajectory[1] = random_trj1;
assign new_enemy_trajectory[2] = random_trj2;
assign new_enemy_trajectory[3] = random_trj3;

assign new_enemy_lives[0] = life0;
assign new_enemy_lives[1] = life1;
assign new_enemy_lives[2] = life2;
assign new_enemy_lives[3] = life3;


always @(posedge clk) begin
	 // enemy trj and life assign
    if(enemy_number <= 4'b0010) begin
        for(i = 0; i < 4; i = i + 1) begin  // Change the increment to i + 1 for the loop to iterate correctly
				if (enemy_trajectory[new_enemy_trajectory[i]] == 4'b0000) begin
					enemy_trajectory[new_enemy_trajectory[i]] = 4'b0001;
					enemy_life[new_enemy_trajectory[i]] = new_enemy_lives[i];
				end
        end
    end

	 //Fire button and life management
	 if (btnFire) begin 
		if (SWmode == 0) begin
			for (h = 0; h < 5; h = h + 1) begin
				if (enemy_trajectory[ss_front_wire - 2 + h] != 4'b0000) begin
					if (enemy_life[ss_front_wire - 2 + h] == 2'b01) begin
						score = score + 16'd1;
						enemy_life[ss_front_wire - 2 + h] = 2'b00;
						enemy_trajectory[ss_front_wire - 2 + h] = 4'b0000;
					end else if (enemy_life[ss_front_wire - 2 + h] == 2'b10 || enemy_life[ss_front_wire - 2 + h] == 2'b11) begin 
						enemy_life[ss_front_wire - 2 + h] = enemy_life[ss_front_wire - 2 + h] - 2'b01;
					end
				end
			end
		end else if (SWmode == 1) begin
			for (j = 0; j < 3; j  = j + 1) begin
				if (enemy_trajectory[ss_front_wire - 1 + j] != 4'b0000) begin
					score = score + 16'd1;
					enemy_life[ss_front_wire - 1 + j] = 2'b00;
					enemy_trajectory[ss_front_wire - 1 + j] = 4'b0000; 
				end
			end
		end
	 end 
end

assign scoreOut = score;

wire [3:0] enemy_trajectory_wire [15:0];
assign enemy_trajectory_wire[0] = enemy_trajectory[0];
assign enemy_trajectory_wire[1] = enemy_trajectory[1];
assign enemy_trajectory_wire[2] = enemy_trajectory[2];
assign enemy_trajectory_wire[3] = enemy_trajectory[3];
assign enemy_trajectory_wire[4] = enemy_trajectory[4];
assign enemy_trajectory_wire[5] = enemy_trajectory[5];
assign enemy_trajectory_wire[6] = enemy_trajectory[6];
assign enemy_trajectory_wire[7] = enemy_trajectory[7];
assign enemy_trajectory_wire[8] = enemy_trajectory[8];
assign enemy_trajectory_wire[9] = enemy_trajectory[9];
assign enemy_trajectory_wire[10] = enemy_trajectory[10];
assign enemy_trajectory_wire[11] = enemy_trajectory[11];
assign enemy_trajectory_wire[12] = enemy_trajectory[12];
assign enemy_trajectory_wire[13] = enemy_trajectory[13];
assign enemy_trajectory_wire[14] = enemy_trajectory[14];
assign enemy_trajectory_wire[15] = enemy_trajectory[15];


assign e_life0 = enemy_life[0];
assign e_life1 = enemy_life[1];
assign e_life2 = enemy_life[2];
assign e_life3 = enemy_life[3];
assign e_life4 = enemy_life[4];
assign e_life5 = enemy_life[5];
assign e_life6 = enemy_life[6];
assign e_life7 = enemy_life[7];
assign e_life8 = enemy_life[8];
assign e_life9 = enemy_life[9];
assign e_life10 = enemy_life[10];
assign e_life11 = enemy_life[11];
assign e_life12 = enemy_life[12];
assign e_life13 = enemy_life[13];
assign e_life14 = enemy_life[14];
assign e_life15 = enemy_life[15];


//END OF THE ENEMY LIFE AND TRAJECTORY ASSIGMENT

///////////////////////////////////////////////////////////////////////////////////

//ENEMY TRAJECTORY GENERATION

reg [15:0] lfsr_trj;
wire feedback_trj = lfsr_trj[15] ^ lfsr_trj[14] ^ lfsr_trj[12] ^ lfsr_trj[3];

reg [3:0] random_trj0 = 4'b0010; // Initial value 2
reg [3:0] random_trj1 = 4'b0101; // Initial value 5
reg [3:0] random_trj2 = 4'b1011; // Initial value 11
reg [3:0] random_trj3 = 4'b1101; // Initial value 13

always @(posedge clk or posedge reset) begin
    if (reset) begin
        lfsr_trj <= 16'hACE1; // A non-zero seed value
        random_trj0 <= 4'b0010; // Initial value 2
        random_trj1 <= 4'b0101; // Initial value 5
        random_trj2 <= 4'b1011; // Initial value 11
        random_trj3 <= 4'b1101; // Initial value 13
    end else begin
        lfsr_trj <= {lfsr_trj[14:0], feedback_trj};
        random_trj0 <= lfsr_trj[3:0];
        random_trj1 <= lfsr_trj[7:4];
        random_trj2 <= lfsr_trj[11:8];
        random_trj3 <= lfsr_trj[15:12];
    end
end

//END OF ENEMY TRAJECTORY GENERATION

///////////////////////////////////////////////////////////////////////////////////

// ENEMY LIFE GENERATION

reg [7:0] lfsr_life;
wire feedback_life = lfsr_life[7] ^ lfsr_life[5] ^ lfsr_life[4] ^ lfsr_life[3];

reg [1:0] life0 = 2'b01;
reg [1:0] life1 = 2'b10;
reg [1:0] life2 = 2'b11;
reg [1:0] life3 = 2'b01;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        lfsr_life <= 8'hA5; // A non-zero seed value
        life0 <= 2'b01;
        life1 <= 2'b10;
        life2 <= 2'b11;
        life3 <= 2'b01;
    end else begin
        lfsr_life <= {lfsr_life[6:0], feedback_life};
        // Ensuring the values are between 1 and 3 by adding 1 to the 2-bit output
        life0 <= (lfsr_life[1:0] % 3) + 2'b01;
        life1 <= (lfsr_life[3:2] % 3) + 2'b01;
        life2 <= (lfsr_life[5:4] % 3) + 2'b01;
        life3 <= (lfsr_life[7:6] % 3) + 2'b01;
    end
end

//END OF ENEMY LIFE GENERATION

///////////////////////////////////////////////////////////////////////////////////

// GAME CLOCK GENERATION
/*
reg clk_1Hz;

localparam integer MAX_COUNT_1Hz = 50000000; // 50 million

// Register to keep the count
reg [24:0] count_1Hz;

always @(posedge clk or posedge clk_reset) begin
    if (clk_reset) begin
        count_1Hz <= 25'd0;
        clk_1Hz <= 1'b0;
    end else begin
        if (count_1Hz == MAX_COUNT_1Hz - 1) begin
           count_1Hz <= 25'd0;
           clk_1Hz <= ~clk_1Hz; // Toggle the output clock
        end else begin
            count_1Hz <= count_1Hz + 25'd1;
        end
    end
end

wire OneHzCLK;
assign OneHzCLK = clk_1Hz;
*/
//END OF GAME CLOCK GNEERATION

///////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////

initial begin
	count = 4'b0011;
	
	//ENEMY TRAJECYORY ASSIGNMENT INITIAL VALUES
	
	enemy_trajectory[0] = 4'b0001; //INITIALLY 1
	enemy_trajectory[1] = 4'b0000;
	enemy_trajectory[2] = 4'b0000;
	enemy_trajectory[3] = 4'b0000;
	enemy_trajectory[4] = 4'b0000;
	enemy_trajectory[5] = 4'b0000;
	enemy_trajectory[6] = 4'b0001;//INITIALLY 1
	enemy_trajectory[7] = 4'b0000;
	enemy_trajectory[8] = 4'b0000;
	enemy_trajectory[9] = 4'b0000;
	enemy_trajectory[10] = 4'b0001;//INITIALLY 1
	enemy_trajectory[11] = 4'b0000;
	enemy_trajectory[12] = 4'b0000;
	enemy_trajectory[13] = 4'b0000;
	enemy_trajectory[14] = 4'b0000;
	enemy_trajectory[15] = 4'b0000;
	
	enemy_life[0] = 2'b01;//INITIALLY 1
	enemy_life[1] = 2'b00;
	enemy_life[2] = 2'b00;
	enemy_life[3] = 2'b00;
	enemy_life[4] = 2'b00;
	enemy_life[5] = 2'b00;
	enemy_life[6] = 2'b10;//INITIALLY 2
	enemy_life[7] = 2'b00;
	enemy_life[8] = 2'b00;
	enemy_life[9] = 2'b00;
	enemy_life[10] = 2'b11;//INITIALLY 3
	enemy_life[11] = 2'b00;
	enemy_life[12] = 2'b00;
	enemy_life[13] = 2'b00;
	enemy_life[14] = 2'b00;
	enemy_life[15] = 2'b00;

	ss_front = 4'b0000;
	
end
endmodule

