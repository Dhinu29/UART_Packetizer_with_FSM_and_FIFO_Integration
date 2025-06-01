module async_fifo (
    input wire wr_clk,
    input wire rd_clk,
    input wire rst,
    input wire wr_en,
    input wire rd_en,
    input wire [7:0] din,
    output reg [7:0] dout,
    output wire fifo_full,
    output wire fifo_empty,
    output wire data_out_valid
);
    localparam DEPTH = 16;
    localparam ADDR_WIDTH = 4;

    reg [7:0] mem [DEPTH-1:0];

    reg [ADDR_WIDTH-1:0] wr_ptr = 0;
    reg [ADDR_WIDTH-1:0] rd_ptr = 0;

    // Gray code pointers for synchronization
    reg [ADDR_WIDTH-1:0] wr_ptr_gray = 0;
    reg [ADDR_WIDTH-1:0] rd_ptr_gray = 0;

    // Synchronized pointers in opposite clock domains
    reg [ADDR_WIDTH-1:0] wr_ptr_gray_sync1 = 0;
    reg [ADDR_WIDTH-1:0] wr_ptr_gray_sync2 = 0;

    reg [ADDR_WIDTH-1:0] rd_ptr_gray_sync1 = 0;
    reg [ADDR_WIDTH-1:0] rd_ptr_gray_sync2 = 0;

    // Function to convert binary to gray code
    function [ADDR_WIDTH-1:0] bin2gray(input [ADDR_WIDTH-1:0] bin);
        bin2gray = (bin >> 1) ^ bin;
    endfunction

    // Function to convert gray to binary
    function [ADDR_WIDTH-1:0] gray2bin(input [ADDR_WIDTH-1:0] gray);
        integer i;
        begin
            gray2bin[ADDR_WIDTH-1] = gray[ADDR_WIDTH-1];
            for (i = ADDR_WIDTH-2; i >= 0; i = i - 1)
                gray2bin[i] = gray2bin[i+1] ^ gray[i];
        end
    endfunction

    // Write pointer logic (wr_clk domain)
    always @(posedge wr_clk or posedge rst) begin
        if (rst) begin
            wr_ptr <= 0;
            wr_ptr_gray <= 0;
        end else if (wr_en && !fifo_full) begin
            mem[wr_ptr] <= din;
            wr_ptr <= wr_ptr + 1;
            wr_ptr_gray <= bin2gray(wr_ptr + 1);
        end
    end

    // Read pointer logic (rd_clk domain)
    always @(posedge rd_clk or posedge rst) begin
        if (rst) begin
            rd_ptr <= 0;
            rd_ptr_gray <= 0;
            dout <= 0;
        end else if (rd_en && !fifo_empty) begin
            dout <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            rd_ptr_gray <= bin2gray(rd_ptr + 1);
        end
    end

    // Synchronize write pointer into read clock domain
    always @(posedge rd_clk or posedge rst) begin
        if (rst) begin
            wr_ptr_gray_sync1 <= 0;
            wr_ptr_gray_sync2 <= 0;
        end else begin
            wr_ptr_gray_sync1 <= wr_ptr_gray;
            wr_ptr_gray_sync2 <= wr_ptr_gray_sync1;
        end
    end

    // Synchronize read pointer into write clock domain
    always @(posedge wr_clk or posedge rst) begin
        if (rst) begin
            rd_ptr_gray_sync1 <= 0;
            rd_ptr_gray_sync2 <= 0;
        end else begin
            rd_ptr_gray_sync1 <= rd_ptr_gray;
            rd_ptr_gray_sync2 <= rd_ptr_gray_sync1;
        end
    end

    // Convert synchronized gray pointers back to binary
    wire [ADDR_WIDTH-1:0] wr_ptr_sync_bin = gray2bin(wr_ptr_gray_sync2);
    wire [ADDR_WIDTH-1:0] rd_ptr_sync_bin = gray2bin(rd_ptr_gray_sync2);

    // FIFO status flags (in wr_clk domain)
    assign fifo_full = ((wr_ptr + 1) == rd_ptr_sync_bin) ||
                       ((wr_ptr + 1 - rd_ptr_sync_bin) == DEPTH);

    // FIFO status flags (in rd_clk domain)
    assign fifo_empty = (rd_ptr == wr_ptr_sync_bin);

    assign data_out_valid = ~fifo_empty;

endmodule
