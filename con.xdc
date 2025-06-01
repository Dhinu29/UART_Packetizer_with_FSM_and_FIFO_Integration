set_property IOSTANDARD LVCMOS33 [get_ports {din[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dout[*]}]
# #set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets wr_clk_IBUF]

## Clock input
#set_property PACKAGE_PIN B16 [get_ports wr_clk]
#set_property IOSTANDARD LVCMOS33 [get_ports wr_clk]

## Read clock
#set_property PACKAGE_PIN A16 [get_ports rd_clk]
#set_property IOSTANDARD LVCMOS33 [get_ports rd_clk]

## Reset
#set_property PACKAGE_PIN C15 [get_ports rst]
#set_property IOSTANDARD LVCMOS33 [get_ports rst]

## FIFO Write Enable
#set_property PACKAGE_PIN B15 [get_ports wr_en]
#set_property IOSTANDARD LVCMOS33 [get_ports wr_en]

## FIFO Read Enable
#set_property PACKAGE_PIN B18 [get_ports rd_en]
#set_property IOSTANDARD LVCMOS33 [get_ports rd_en]

## FIFO Full
#set_property PACKAGE_PIN A18 [get_ports fifo_full]
#set_property IOSTANDARD LVCMOS33 [get_ports fifo_full]

## FIFO Empty
#set_property PACKAGE_PIN P19 [get_ports fifo_empty]
#set_property IOSTANDARD LVCMOS33 [get_ports fifo_empty]

## Data input bus (8-bit)
#set_property PACKAGE_PIN V19 [get_ports {din[0]}]
#set_property PACKAGE_PIN P17 [get_ports {din[1]}]
#set_property PACKAGE_PIN R17 [get_ports {din[2]}]
#set_property PACKAGE_PIN U18 [get_ports {din[3]}]
#set_property PACKAGE_PIN W17 [get_ports {din[4]}]
#set_property PACKAGE_PIN W18 [get_ports {din[5]}]
#set_property PACKAGE_PIN V16 [get_ports {din[6]}]
#set_property PACKAGE_PIN U15 [get_ports {din[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {din[*]}]

## Data output bus (8-bit)
#set_property PACKAGE_PIN L3 [get_ports {dout[0]}]
#set_property PACKAGE_PIN L2 [get_ports {dout[1]}]
#set_property PACKAGE_PIN L1 [get_ports {dout[2]}]
#set_property PACKAGE_PIN G2 [get_ports {dout[3]}]
#set_property PACKAGE_PIN G1 [get_ports {dout[4]}]
#set_property PACKAGE_PIN V3 [get_ports {dout[5]}]
#set_property PACKAGE_PIN V4 [get_ports {dout[6]}]
#set_property PACKAGE_PIN W3 [get_ports {dout[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[*]}]

## Output valid signal
#set_property PACKAGE_PIN U6 [get_ports data_out_valid]
#set_property IOSTANDARD LVCMOS33 [get_ports data_out_valid]
## Clock Inputs
set_property PACKAGE_PIN B16 [get_ports wr_clk]
set_property IOSTANDARD LVCMOS33 [get_ports wr_clk]

set_property PACKAGE_PIN A14 [get_ports rd_clk]
set_property IOSTANDARD LVCMOS33 [get_ports rd_clk]

## Reset
set_property PACKAGE_PIN C15 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## FIFO Control Signals
set_property PACKAGE_PIN B15 [get_ports wr_en]
set_property IOSTANDARD LVCMOS33 [get_ports wr_en]

set_property PACKAGE_PIN B18 [get_ports rd_en]
set_property IOSTANDARD LVCMOS33 [get_ports rd_en]

set_property PACKAGE_PIN A18 [get_ports fifo_full]
set_property IOSTANDARD LVCMOS33 [get_ports fifo_full]

set_property PACKAGE_PIN P19 [get_ports fifo_empty]
set_property IOSTANDARD LVCMOS33 [get_ports fifo_empty]

## Data Input Bus (8-bit)
set_property PACKAGE_PIN V19 [get_ports {din[0]}]
set_property PACKAGE_PIN P17 [get_ports {din[1]}]
set_property PACKAGE_PIN R17 [get_ports {din[2]}]
set_property PACKAGE_PIN U18 [get_ports {din[3]}]
set_property PACKAGE_PIN W17 [get_ports {din[4]}]
set_property PACKAGE_PIN W18 [get_ports {din[5]}]
set_property PACKAGE_PIN V16 [get_ports {din[6]}]
set_property PACKAGE_PIN U15 [get_ports {din[7]}]

## Data Output Bus (8-bit)
set_property PACKAGE_PIN L3 [get_ports {dout[0]}]
set_property PACKAGE_PIN L2 [get_ports {dout[1]}]
set_property PACKAGE_PIN L1 [get_ports {dout[2]}]
set_property PACKAGE_PIN G2 [get_ports {dout[3]}]
set_property PACKAGE_PIN G1 [get_ports {dout[4]}]
set_property PACKAGE_PIN V3 [get_ports {dout[5]}]
set_property PACKAGE_PIN V4 [get_ports {dout[6]}]
set_property PACKAGE_PIN W3 [get_ports {dout[7]}]

## Output Valid Signal
set_property PACKAGE_PIN U6 [get_ports data_out_valid]
set_property IOSTANDARD LVCMOS33 [get_ports data_out_valid]


set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets rd_clk_IBUF]

set_property BEL C5FF [get_cells {mem_reg[7][7]}]
set_property LOC SLICE_X1Y22 [get_cells {mem_reg[7][7]}]
