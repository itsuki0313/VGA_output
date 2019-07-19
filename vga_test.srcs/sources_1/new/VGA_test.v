
module VGA_test(
input           clk_50,
input           r_switch,
input           b_switch,
input           g_switch,
input           rst,

output  [11:0]  rgb_data,
output          vga_hsync,
output          vga_vsync,
output          xclk
);

reg         clk_25;
reg  [11:0] data;
reg  [9:0]  hcnt;
reg  [9:0]  vcnt;
reg         vga_hsync;
reg         vga_vsync;
reg  [11:0] rgb_data;

//clock
always @(posedge clk_50 or posedge rst) begin
    if(rst) begin
        clk_25 <= 1'b0;
    end else begin
        clk_25 <= ~clk_25;
    end
end

assign xclk = clk_25;

//display color chage
always @(posedge clk_25 or posedge rst) begin
    if(rst) begin
        data <= 12'b000000000000;
    end else if(r_switch) begin
        data <= 12'b000000001111;
    end else if(g_switch) begin
        data <= 12'b000011110000;
    end else if(b_switch) begin
        data <= 12'b111100000000;
    end else begin
        data <= 12'b111111111111;
    end;
end

//assign rgb_data = data;

//vga_hsync & vga_vsync
parameter   HMAX = 800;
parameter   HVALID = 640;
parameter   HPULSE = 96;
parameter   HBPORCH = 16;

parameter   VMAX = 521;
parameter   VVALID = 480;
parameter   VPULSE = 2;
parameter   VBPORCH = 10;

always @(posedge clk_25) begin      //hsync count
    if(rst)
        hcnt <= 0;
    else if( hcnt==HMAX-1 )
        hcnt <= 0;
    else
        hcnt <= hcnt + 1;
end

always @(posedge clk_25) begin      //vsync count
    if(rst)
        vcnt <= 0;
    else if( hcnt==HMAX-1 )
        if( vcnt==VMAX-1 )
            vcnt <= 0;
        else
            vcnt <= vcnt + 1;
    else
        vcnt <= vcnt;
end

always @(posedge clk_25) begin
    if((vcnt >= (VVALID + VBPORCH)) && (vcnt < (VVALID + VBPORCH + VPULSE)))    //vga_vsync output data
        vga_vsync <= 0;
    else
        vga_vsync <= 1;
    if((hcnt >= (HVALID + HBPORCH)) && (hcnt < (HVALID + HBPORCH + HPULSE)))    ////vga_hsync output data
        vga_hsync <= 0;
    else
        vga_hsync <= 1;
end

always @(posedge clk_25) begin 
    if((vcnt < VVALID) && (hcnt < HVALID))                                      //display saiz
        rgb_data <= data;
    else
        rgb_data <= 12'b000000000000;
end


endmodule