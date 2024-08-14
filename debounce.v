`timescale 1ns / 1ps

module debounce (
        input clk,
        input button,
        output reg button_db = 0,   // if it is pressed for 5 cycle it gives 1 as output for 6-7 cycle
        output button_press,        // 1 for 1 cycle when db posedge
        output button_release			// 1 for 1 cycle when db negedge
    );
    
    parameter PERIOD = 5;
    parameter PERIOD_WIDTH = 5;
    reg [PERIOD_WIDTH - 1:0] count = 0;

    reg changed = 0;
    assign button_press = changed & button_db;
    assign button_release = changed & ~button_db;

    reg sync_0 = 0;
    reg sync_1 = 0;

    reg flag;

    always @ (posedge clk) begin
        sync_0 <= button;
        sync_1 <= sync_0;

        flag = 0;
        if (button != button_db) begin
            if (count == PERIOD - 1) begin
                flag = 1;
                button_db <= sync_1;
            end else begin
                count <= count + 1;
            end
        end
        else begin
            count <= 0;
        end

        changed <= flag;
    end
endmodule
