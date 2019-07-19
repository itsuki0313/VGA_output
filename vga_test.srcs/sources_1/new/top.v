module top (
input        clk_125,
input        rst,
input        r_switch,
input        b_switch,
input        g_switch,
output       xclk,
output       vga_vsync,
output       vga_hsync,
output [3:0] vga_r,
output [3:0] vga_g,
output [3:0] vga_b
);

wire  clk_50;

wire [11:0] rgb_data;

clk_wiz_0 clk_wiz_0(
    .clk_in1(clk_125),
    .clk_out1(clk_50)
);

VGA_test VGA(
    .clk_50(clk_50),
    .rst(rst),
    .r_switch(r_switch),
    .g_switch(g_switch),
    .b_switch(b_switch),
    
    .rgb_data(rgb_data),
    .vga_hsync(vga_hsync),
    .vga_vsync(vga_vsync),
    .xclk
);

assign {vga_r,vga_g,vga_b} = rgb_data;


endmodule
