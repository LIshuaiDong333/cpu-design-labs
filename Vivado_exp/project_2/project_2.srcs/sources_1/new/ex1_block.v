`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/25 15:00:23
// Design Name: 
// Module Name: ex1_block
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

module ex1_block(
    input  clk,
    output [3:0] data
);
    assign data = cnt;
    reg [3:0] cnt = 4'h0;   // 按规范是要在复位时给初值，这里做了简化
    always @(posedge clk)
    begin
        cnt = 5;
        cnt = cnt + 1'b1;
    end

endmodule
