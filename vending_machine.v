
module vending_machine(
    input clk,
    input reset,
    input one_rupee,
    input two_rupee,
    input cancel,             // <-- NEW INPUT
    output reg product,
    output reg [2:0] return_coin  // <-- NEW OUTPUT (max 7)
);

    reg [2:0] total;  // Tracks total money inserted (max 7)

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            total <= 0;
            product <= 0;
            return_coin <= 0;
        end else begin
            product <= 0;
            return_coin <= 0;

            // Handle cancellation and return coins
            if (cancel) begin
                return_coin <= total;
                total <= 0;
            end else begin
                // Accept coins
                case ({two_rupee, one_rupee})
                    2'b01: total <= total + 1;
                    2'b10: total <= total + 2;
                    2'b11: total <= total + 3;
                    default: total <= total;
                endcase

                // Check if total is enough to dispense
                if (total >= 5) begin
                    product <= 1;
                    total <= total - 5;
                end
            end
        end
    end

endmodule
