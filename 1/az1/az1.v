`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:44 01/28/2022 
// Design Name: 
// Module Name:    az1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module az1(
    input [15:0] a,
    output [1:0] out);

    bcd_mod3 mod3 (a, out[0]);
    bcd_mod11 mod11 (a, out[1]);
    
endmodule

module bcd_mod11 (
    input [15:0] a, 
    output out);

    wire [3:0] s1;
    wire c1;
    adder_4bit adder1 (a[11:8], a[3:0], c1, s1);

    wire [3:0] s2;
    wire c2;
    adder_4bit adder2 (a[15:12], a[7:4], c2, s2);

    wire tempComp1;
    comp_5bit comp1 ({c1, s1}, {c2, s2}, tempComp1);

    wire [3:0] s3;
    wire c3;
    adder_4bit adder3 (s1, 4'b1011, c3, s3);

    wire tempComp2;
    comp_5bit fcc2 ({c3, s3}, {c2, s2}, tempComp2);

    wire [3:0] s4;
    wire c4;
    adder_4bit adder4 (s2, 4'b1011, c4, s4);

    wire tempComp3;
    comp_5bit fcc3 ({c1, s1}, {c4, s4}, tempComp3);
    
    or or1 (out, tempComp1, tempComp2, tempComp3);
endmodule



module bcd_mod3(
    input [15:0] a,
    output out
);
    wire [3:0] temp1;
    bcd_3_add_each add_each1 (a[3:0], a[7:4], temp1);
    
    wire [3:0] temp2;
    bcd_3_add_each add_each2 (a[11:8], temp1, temp2);
    
    wire [3:0] temp3;
    bcd_3_add_each add_each3 (a[15:12], temp2, temp3);
    
    wire se;
    xor xor1 (se, temp3[0], temp3[2]);
    wire so;
    xor xor2 (so, temp3[1], temp3[3]);
    wire ce;
    and and1 (ce, temp3[0], temp3[2]);
    wire co;
    and and2 (co, temp3[1], temp3[3]);
    wire xor_1;
    xor xor3 (xor_1, so, se);
    wire xor_2;
    and and3 (xor_2, ce, co);
    nor(out, xor_1, xor_2);
endmodule



module bcd_3_add_each (
    input [3:0] in0,
    input [3:0] in1,
    output [3:0] out
);
	 wire zero;
	 assign zero = 1'b0;
    
    wire [3:0] addTemp1;
    wire c1;
    adder_4bit adder1 (in0, in1, c1, addTemp1);
    
    wire [3:0] addTemp2;
    wire c2;
    adder_4bit adder2 ({2'b0, addTemp1[3], c1}, {zero, addTemp1[2:0]}, c2, out);
endmodule



module adder_4bit(
	input [3:0] a,
	input [3:0] b,
	output c_out,
	output [3:0] s);

    wire [3:0] tempCarry;
    
	xor xor1 (s[0], a[0], b[0]);
    and and0 (tempCarry[0], a[0], b[0]);

    wire temp1;
    xor xor2 (temp1, a[1], b[1]);
    xor xor3 (s[1], temp1, tempCarry[0]);
    wire andTemp1;
    and and1 (andTemp1, a[1], b[1]);
    wire andTemp2;
    and and2 (andTemp2, temp1, tempCarry[0]);
    or or1 (tempCarry[1], andTemp1, andTemp2);

    wire temp2;
    xor xor4 (temp2, a[2], b[2]);
    xor xor5 (s[2], temp2, tempCarry[1]);
    wire andTemp3;
    and and3 (andTemp3, a[2], b[2]);
    wire andTemp4;
    and and4 (andTemp4, temp2, tempCarry[1]);
    or or2 (tempCarry[2], andTemp3, andTemp4);
    
    wire temp3;
    xor xor6 (temp3, a[3], b[3]);
    xor xor7 (s[3], temp3, tempCarry[2]);
    wire andTemp5;
    and and5 (andTemp5, a[3], b[3]);
    wire andTemp6;
    and and6 (andTemp6, temp3, tempCarry[2]);
    or or3 (tempCarry[3], andTemp5, andTemp6);

    assign c_out = tempCarry[3];
endmodule


module comp_5bit (
  input [4:0] a,
  input [4:0] b,
  output out);

  wire w1;
  xnor xnor1 (w1, a[0], b[0]);
  
  wire w2;
  xnor xnor2 (w2, a[1], b[1]);
  
  wire w3;
  xnor xnor3 (w3, a[2], b[2]);
  
  wire w4;
  xnor xnor4 (w4, a[3], b[3]);
  
  wire w5;
  xnor xnor5 (w5, a[4], b[4]);

  and and1 (out, w1, w2, w3, w4, w5);
endmodule
