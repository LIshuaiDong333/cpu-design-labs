`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 18:21:53
// Design Name: 
// Module Name: flowing_water_lights
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


module flowing_water_lights(
    input clk,               // 时钟信号
    input rst,               // 复位信号
    input button,            // 按钮，切换暂停/继续
    input [1:0] freq_set,    // 频率设置 (两位)
    input dir_set,           // 方向设置
    output reg [7:0] led     // LED 输出
);

    reg [23:0] counter;      // 计数器用于控制频率
    reg pause;               // 暂停标志
    reg [7:0] shift_reg;     // 用于流动的移位寄存器

    // 频率参数设置
    wire [23:0] freq;
    assign freq = (freq_set == 2'b00) ? 24'd1_000_000 :   // ：100Hz
                  (freq_set == 2'b01) ? 24'd10_000_000 :   // ： (10Hz)
                  (freq_set == 2'b10) ? 24'd25_000_000 :   // ： (4Hz)
                   24'd50_000_000;       // ：(2Hz)

    // 复位和暂停按钮逻辑
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            shift_reg <= 8'b00000001;  // 初始 LED 状态，点亮第一个 LED
            pause <= 1;
            led <= 8'b00000001;
        end
        else if (button) 
        begin
            pause <= ~pause;  // 切换暂停状态
        end
        else if (!pause) 
        begin
            if (counter >= freq) 
            begin
                counter <= 0;
                if (dir_set)  // 方向设定: dir_set == 1 为右移
                    shift_reg <= {shift_reg[0], shift_reg[7:1]};
                else          // dir_set == 0 为左移
                    shift_reg <= {shift_reg[6:0], shift_reg[7]};
                led <= shift_reg;  // 更新 LED 输出
            end else 
            begin
                counter <= counter + 1;
            end
        end
        end
endmodule
