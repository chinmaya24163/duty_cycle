`timescale 1ns / 1ps

module duty_cycle(input clk, output reg out);
    reg [1:0] curr_state = 0; 
    reg [1:0] next_state;

    always @(posedge clk) begin
        curr_state <= next_state;
    end

    always @(*) begin
        case(curr_state)
            2'b00: out = 1;
            2'b01: out = 0;
            2'b10: out = 0;
            2'b11: out = 0;
            default: out = 0;
        endcase
    end

    always @(*) begin
        next_state = curr_state + 1;
    end    
endmodule