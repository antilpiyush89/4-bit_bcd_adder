`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2026 16:40:47
// Design Name: 
// Module Name: bcd_adder_tb
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


module bcd_adder_tb();
reg [3:0] a,b;
reg cin;
wire [7:0] bcd_out;

// bcd_adder unit under test (uut)
// Instantiate the module bcd_adder
bcd_adder uut(.a(a),.b(b),.cin(cin),.bcd_out(bcd_out));

// Test cases
initial begin

// Test case-1 Simple addition 5 + 2 = 7 < 9
a = 4'd5; b = 4'd2; cin = 1'b0;
#10;

// Test case-2 require changes 7 + 8 = 15 > 9
a = 4'd7; b = 4'd8; cin = 1'b0;
#10;

// Test case-3 max possible sum 9 + 9 + 1 = 19 > 9
a = 4'd9; b = 4'd9; cin = 1'b1;
#10;

#10 $finish;
end

initial begin
$monitor("Time = %t | a = %d | b = %d | cin = %b | bcd_out = %h", $time, a,b,cin, bcd_out);

end



endmodule
