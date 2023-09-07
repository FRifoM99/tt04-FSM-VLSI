module PWM_generator (
    input wire clk,
    input wire [7:0] stepCountBit,
    output reg pwm,
    //input  pwm_value,
    input wire reset
);

parameter sd = 39;

reg [13:0] counter = 0;
//PROCESS
always @ (posedge clk)
begin
    if (reset) 
        counter = 0;
//calculating duty cycle
    counter = counter + 1;
    if(counter <= stepCountBit * sd) 
        pwm = 1;
    else 
        pwm = 0;
//refresh every 1ms
    if(counter >= 10000) 
        counter = 0;
end
endmodule