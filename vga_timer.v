/*
simple 480p display module
The vga_timer module generates timing signals for a VGA display with a resolution of 640x480 pixels, 
synchronized to a clock signal (25Mhz input clk frequency).The module provides horizontal (hsync) and vertical (vsync) synchronization 
signals, as well as a display enable (de) signal that indicates when the display is in the active region.
It resets when rst = 1
*/

module vga_timer (
        input wire clk,
        input wire rst,
        output reg [9:0] sx,  // x pixel position  (0,0) top left position, (639,479) bottom left
        output reg [9:0] sy,  // y pixel position
        output reg hsync,
        output reg vsync,
        output reg de // low in blanking interval
    );

    parameter HA_END = 639;
    parameter HS_STA = HA_END + 16;
    parameter HS_END = HS_STA + 96;
    parameter LINE = 799;

    parameter VA_END = 479;
    parameter VS_STA = VA_END + 10;
    parameter VS_END = VS_STA + 2;
    parameter SCREEN = 524;

    always @ (sx, sy) begin
        hsync = ~(sx >= HS_STA && sx < HS_END);
        vsync = ~(sy >= VS_STA && sy < VS_END);
        de = (sx <= HA_END && sy <= VA_END);
    end

    always @(posedge clk) begin
        if (sx == LINE) begin
            sx <= 0;
            sy <= (sy == SCREEN) ? 0 : sy + 1;
        end else begin
            sx <= sx + 1;
        end
        if (rst) begin
            sx <= 0;
            sy <= 0;
        end
    end
endmodule
