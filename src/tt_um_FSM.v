`timescale 1ns / 1ps

module tt_um_FSM (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    
    wire reset;
    wire f_sensor, l_sensor, r_sensor;
    wire [4:0] data_in;
    reg motorA_d, motorA_i, motorB_d, motorB_i;
    
    // reg [3:0] flags = 4'b0000;
    // PWM
    reg pwm;
    parameter sd = 39;
    reg [13:0] counter = 0;

    wire [3:0] motors;

    assign uio_oe = 8'b0000_0000; //todos input
    assign {data_in, f_sensor, l_sensor, r_sensor} = ui_in;

    reg [1:0] state, next_state;

    assign uo_out = {motors, 4'b000};

    assign uio_out = 8'b0000_0000;

    assign motors[0] = motorB_i;
    assign motors[1] = motorB_d;
    assign motors[2] = motorA_i;
    assign motors[3] = motorB_d;
    assign reset = ~rst_n;

    

    parameter Standby = 2'b00;
    parameter goforward = 2'b01;
    parameter goright = 2'b10;
    parameter goleft = 2'b11;

    always @(posedge clk) begin
        if (reset)
            state <= Standby;
            counter <= 0;
        else
            state <= next_state;

    //calculating duty cycle
    counter <= counter + 1;
    if(counter <= uio_in * sd) 
        pwm = 1;
    else 
        pwm = 0;
    //refresh every 1ms
    if(counter >= 10000) 
        counter = 0;
    end

    always @* begin
        next_state = Standby;
        case (state)
            Standby: begin
                motorB_i = 0 & pwm; 
                motorB_d = 0 & pwm;
                motorA_i = 0 & pwm;
                motorA_d = 0 & pwm;

                if (f_sensor == 0 && l_sensor == 0 && r_sensor == 0) begin
                    next_state = goforward;
                end
                else if (f_sensor == 0 && l_sensor == 1 && r_sensor == 1) begin
                    next_state = goforward;
                end
                else if (l_sensor == 1 && r_sensor == 0) begin
                    next_state = goright;
                end
                else if (f_sensor == 1 && r_sensor == 0) begin
                    next_state = goright;
                end
                else if (l_sensor == 0 && r_sensor == 1) begin
                    next_state = goleft;
                end
            end
            goforward: begin
                motorB_i = 0 & pwm;
                motorB_d = 1 & pwm;
                motorA_i = 0 & pwm;
                motorA_d = 1 & pwm;

                if (f_sensor == 0 && l_sensor == 0 && r_sensor == 0) begin
                    next_state = state;
                end
                else if (f_sensor == 0 && l_sensor == 1 && r_sensor == 1) begin
                    next_state = state;
                end
            end
            goright: begin 
                motorB_i = 1 & pwm;
                motorB_d = 0 & pwm;
                motorA_i = 0 & pwm;
                motorA_d = 1 & pwm;

                if (l_sensor == 1 && r_sensor == 0) begin
                    next_state = state;
                end
            end
            goleft: begin 
                motorB_i = 0 & pwm;
                motorB_d = 1 & pwm;
                motorA_i = 1 & pwm;
                motorA_d = 0 & pwm;

                if (l_sensor == 0 && r_sensor == 1) begin
                    next_state = state;
                end
            end
        endcase
    end
    
endmodule
