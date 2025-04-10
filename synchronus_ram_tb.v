`timescale 1ns / 1ps

module tb_Synchronous_RAM;
    reg clk;
    reg we;
    reg [7:0] addr;
    reg [31:0] data_in;
    wire [31:0] data_out;
    Synchronous_RAM uut (.clk(clk),.we(we),.addr(addr),.data_in(data_in),.data_out(data_out));

    always #5 clk = ~clk;

    initial
	begin
        clk = 0; we = 0; addr = 0; data_in = 0;
        #10 we = 1; addr = 8'd10; data_in = 32'h12345678;
        #10 we = 0;
        #10 addr = 8'd10;
        #10 we = 1; addr = 8'd20; data_in = 32'hAABBCCDD;
        #10 we = 0;
        #10 addr = 8'd20;
        #10 $finish;
    end
    initial
	begin
        $monitor( $time,"Time = %0t | WE = %b | Addr = %d | Data In = %h | Data Out = %h", we, addr, data_in, data_out);
    end

endmodule
