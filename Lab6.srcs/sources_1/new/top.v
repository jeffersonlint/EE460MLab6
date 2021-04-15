`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2021 02:14:13 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    input [7:0] a11,
    input [7:0] a12,
    input [7:0] a13,
    input [7:0] a21,
    input [7:0] a22,
    input [7:0] a23,
    input [7:0] a31,
    input [7:0] a32,
    input [7:0] a33,
    input [7:0] b11,
    input [7:0] b12,
    input [7:0] b13,
    input [7:0] b21,
    input [7:0] b22,
    input [7:0] b23,
    input [7:0] b31,
    input [7:0] b32,
    input [7:0] b33,
    output reg [7:0] c11,
    output reg [7:0] c12,
    output reg [7:0] c13,
    output reg [7:0] c21,
    output reg [7:0] c22,
    output reg [7:0] c23,
    output reg [7:0] c31,
    output reg [7:0] c32,
    output reg [7:0] c33
    );
    
    reg [7:0] op11a, op11b, op12a, op12b, op13a, op13b, op21a, op21b, op22a, op22b, op23a, op23b, op31a, op31b, op32a, op32b, op33a, op33b;
    reg [3:0] counter;
    
    initial counter = 4'b0000;
    
    always @(negedge clk) begin
        counter = counter + 1;
        case(counter) 
            4'b0001: begin
                op11a <= a11;
                op11b <= b11;
            end
            4'b0010: begin
                op11a <= a12;
                op11b <= b21;
                op12a <= a11;
                op12b <= b12;
                op21a <= a21;
                op21b <= b11;
            end
            4'b0011: begin
                op11a <= a13;
                op11b <= b31;
                op12a <= a12;
                op12b <= b22;
                op13a <= a11;
                op13b <= b13;
                op21a <= a22;
                op21b <= b21;
                op22a <= a21;
                op22b <= b12;
                op31a <= a31;
                op31b <= b11;
            end
            4'b0100: begin
                op12a <= a13;
                op12b <= b32;
                op13a <= a12;
                op13b <= b23;
                op21a <= a23;
                op21b <= b31;
                op22a <= a22;
                op22b <= b22;
                op23a <= a21;
                op23b <= b13;
                op31a <= a32;
                op31b <= b21;
                op32a <= a31;
                op32b <= b12;
            end
            4'b0101: begin
                op13a <= a13;
                op13b <= b33;
                op22a <= a23;
                op22b <= b32;
                op23a <= a22;
                op23b <= b23;
                op31a <= a33;
                op31b <= b31;
                op32a <= a32;
                op32b <= b22;
                op33a <= a31;
                op33b <= b13;
            end
            4'b0110: begin
                op23a <= a23;
                op23b <= b33;
                op32a <= a33;
                op32b <= b32;
                op33a <= a32;
                op33b <= b23;
            end
            4'b0111: begin
                op33a <= a33;
                op33b <= b33;
            end
            default: begin
                op11a <= 4'b0000;
                op11b <= 4'b0000;
                op12a <= 4'b0000;
                op12b <= 4'b0000;
                op13a <= 4'b0000;
                op13b <= 4'b0000;
                op21a <= 4'b0000;
                op21b <= 4'b0000;
                op22a <= 4'b0000;
                op22b <= 4'b0000;
                op23a <= 4'b0000;
                op23b <= 4'b0000;
                op31a <= 4'b0000;
                op31b <= 4'b0000;
                op32a <= 4'b0000;
                op32b <= 4'b0000;
                op33a <= 4'b0000;
                op33b <= 4'b0000;
            end
        endcase
    end
    
    MAC out11(clk, op11a, op11b, c11);
    MAC out12(clk, op12a, op12b, c12);
    MAC out13(clk, op13a, op13b, c13);
    MAC out21(clk, op21a, op21b, c21);
    MAC out22(clk, op22a, op22b, c22);
    MAC out23(clk, op23a, op23b, c23);
    MAC out31(clk, op31a, op31b, c31);
    MAC out32(clk, op32a, op32b, c32);
    MAC out33(clk, op33a, op33b, c33);
    
endmodule
