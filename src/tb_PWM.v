`default_nettype none
`timescale 1ns / 1ps

module PWM_generator_tb;

    reg clk;
    reg [7:0] stepCountBit;
    reg reset;
    wire pwm;

    PWM_generator dut (
        .clk(clk),
        .stepCountBit(stepCountBit),
        .pwm(pwm),
        .reset(reset)
    );

    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
        clk = 0;
        stepCountBit = 8'h01;
        reset = 1;
        #10 reset = 0;
        #100000 $finish;
    end

    always #5 clk = ~clk;

endmodule
