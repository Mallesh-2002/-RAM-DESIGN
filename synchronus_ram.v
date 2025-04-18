module Synchronous_RAM (
    input clk,            
    input we,             
    input [7:0] addr,     
    input [31:0] data_in, 
    output reg [31:0] data_out );
reg [31:0] memory [0:255];

always @(posedge clk) begin
    if (we)
        memory[addr] <= data_in;  
    else
        data_out <= memory[addr]; 
end

endmodule



