`timescale 1ns / 1ns

module vending_machine_tb;

  // Inputs
  reg clk;
  reg reset;
  reg [1:0] item;
  reg five;
  reg ten;

  // Outputs
  wire out;
  wire five_change;

  // Instantiate the Unit Under Test (UUT)
  vending_machine uut (
    .clk(clk),
    .reset(reset),
    .item(item),
    .five(five),
    .ten(ten),
    .out(out),
    .five_change(five_change)
  );

  // Clock generation: 10ns period
  always #5 clk = ~clk;

  // Waveform dump
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, vending_machine_tb);
  end

  // Monitor for output and change
  initial begin
    $monitor("Time = %0t | Item = %b | Five = %b | Ten = %b | OUT = %b | ₹5 Change = %b", 
              $time, item, five, ten, out, five_change);
  end

  // Task to simulate inserting a coin
  task insert_coin(input reg is_five);
    begin
      if (is_five) begin
        five = 1; #10; five = 0;
      end else begin
        ten = 1; #10; ten = 0;
      end
      #10;
    end
  endtask

  // Test procedure
  initial begin
    // Initialize Inputs
    clk = 0;
    reset = 1;
    item = 2'b00;  // Default
    five = 0;
    ten = 0;

    // Release reset
    #10;
    reset = 0;

    // ------------------------
    $display("Test Case 1: ₹15 item (₹5 + ₹10)");
    item = 2'b00;
    insert_coin(1); // ₹5
    insert_coin(0); // ₹10
    #20;

    // ------------------------
    $display("Test Case 2: ₹25 item (₹10 + ₹10 + ₹5)");
    item = 2'b10;
    insert_coin(0); // ₹10
    insert_coin(0); // ₹10
    insert_coin(1); // ₹5
    #20;

    // ------------------------
    $display("Test Case 3: ₹30 item (₹10 + ₹10 + ₹10)");
    item = 2'b11;
    insert_coin(0); // ₹10
    insert_coin(0); // ₹10
    insert_coin(0); // ₹10
    #20;

    // ------------------------
    $display("Test Case 4: ₹20 item (₹10 + ₹10)");
    item = 2'b01;
    insert_coin(0); // ₹10
    insert_coin(0); // ₹10
    #20;

    // ------------------------
    $display("Test Case 5: ₹15 item (₹10 + ₹10)");
    item = 2'b00;
    insert_coin(0); // ₹10
    insert_coin(0); // ₹10  -> Expect ₹5 change
    #20;

    $finish;
  end

endmodule
