`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/25 15:02:19
// Design Name: 
// Module Name: ex1_tb
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


module ex1_tb;
  reg clk = 0;
  wire [3:0] data;

  ex1_block  u_ex1_block (  // 注意与RTL代码一致
    .clk(clk),
    .data(data)
  );

always #5  clk = ! clk ;
endmodule
