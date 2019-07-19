vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+c:/Users/ikeno/Documents/VIVADO/vga_test/vga_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_v5_3_1" "+incdir+../../../../vga_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_v5_3_1" "+incdir+c:/Users/ikeno/Documents/VIVADO/vga_test/vga_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_v5_3_1" "+incdir+../../../../vga_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_v5_3_1" \
"C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+c:/Users/ikeno/Documents/VIVADO/vga_test/vga_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_v5_3_1" "+incdir+../../../../vga_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_v5_3_1" "+incdir+c:/Users/ikeno/Documents/VIVADO/vga_test/vga_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_v5_3_1" "+incdir+../../../../vga_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_v5_3_1" \
"../../../../vga_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../../vga_test.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \

vlog -work xil_defaultlib "glbl.v"

