module clock_divider_1Hz(
    input wire clk_25MHz,  // Input clock at 50MHz
    input wire reset,      // Reset signal
    output reg clk_1Hz     // Output clock at 1Hz
);

    // Parameter to define the maximum count value
    localparam integer MAX_COUNT = 25000000; // 50 million

    // Register to keep the count
    reg [24:0] count;

    always @(posedge clk_25MHz or posedge reset) begin
        if (reset) begin
            count <= 25'd0;
            clk_1Hz <= 1'b0;
        end else begin
            if (count == MAX_COUNT - 1) begin
                count <= 25'd0;
                clk_1Hz <= ~clk_1Hz; // Toggle the output clock
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule
