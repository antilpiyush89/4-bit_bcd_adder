`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2026 16:19:13
// Design Name: 
// Module Name: bcd_adder
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


module bcd_adder(a,b,cin,bcd_out);

input [3:0] a,b;
input cin;
output reg [7:0] bcd_out;

// if a+b+cin > 15 then it will be of 5 bits, then it can't be stored in temp_sum. 
// that is why it has to be 5 bits
// ex- 9 + 8 = 17 ==> 10001(5bits), as temp_sum(4bits), temp_sum = 0001 < 9 and bcd_out = 00000001 = 1 in hexadecimal
// if temp_sum(5bits), temp_sum = 10001 = 17 > 9, then bcd = ( 0001+0110 =0111, bcd_out = (0001)(0111) = 17 in bcd form
reg [4:0] temp_sum;
// combinational, if any change in a,b,cin, then below block is executed
always @(*) begin
   temp_sum = a + b + cin;
   if (temp_sum > 9) begin
       bcd_out[3:0] = temp_sum[3:0] + 4'b0110;
       // or bcd_out[3:0] = temp_sum + 6, verilog will automatically truncate it to lower 4 bites of temp_sum
       bcd_out[7:4] = 4'b0001;
   end
   else begin
   bcd_out[3:0] = temp_sum[3:0];
   bcd_out[7:4] = 4'b0000;
   end
end 
endmodule
