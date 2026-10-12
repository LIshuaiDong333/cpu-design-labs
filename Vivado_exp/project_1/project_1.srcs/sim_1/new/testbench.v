`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 18:47:22
// Design Name: 
// Module Name: testbench
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

module tb_flowing_water_lights;

    reg clk;
    reg rst;
    reg button;
    reg [1:0] freq_set;
    reg dir_set;
    wire [7:0] led;

    // 实例化待测试的流水灯模块
    flowing_water_lights uut (
        .clk(clk),
        .rst(rst),
        .button(button),
        .freq_set(freq_set),
        .dir_set(dir_set),
        .led(led)
    );

    // 时钟信号生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns 时钟周期 (100MHz)
    end

    // 仿真过程
    initial begin
        // 初始化信号
        rst = 1;        // 复位信号
        button = 0;
        freq_set = 2'b01;  // 设置频率为中速 50ms 间隔
        dir_set = 0;    // 初始为左移

        // 释放复位
        #100;
        rst = 0;

        // 仿真流水灯运行，观察左移
        #2000;
        button = 1;  // 按下按钮，切换暂停
        #20;
        button = 0;  // 释放按钮
        
        // 切换方向为右移
        #5000;
        dir_set = 1;  // 改变方向为右移

        // 改变频率为快速
        #5000;
        freq_set = 2'b10;  // 设置频率为快速 (20ms)

        // 结束仿真
        #10000;
        $finish;
    end
endmodule
