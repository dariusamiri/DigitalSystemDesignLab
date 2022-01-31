`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:57 01/29/2022 
// Design Name: 
// Module Name:    JKFF 
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
module JKFF(
	input J,
	input clk,
	input K,
	input CLRN,
	output Q,
	output nQ
);



wire	w_1;
wire	w_2;
wire	w_3;
wire	w_4;
wire	w_5;
wire	w_6;
wire	w_7;
wire	w_8;
wire	w_9;
wire	w_10;

assign	Q = w_1;
assign	nQ = w_8;
assign	w_2 = 1;



assign	w_10 =  ~clk;

assign	w_8 = ~(w_1 & w_2 & w_3);

assign	w_6 = ~(w_4 & w_5);

assign	w_4 = ~(w_6 & w_2 & w_7);

assign	w_7 = ~(clk & K & w_1);

assign	w_5 = ~(w_8 & J & clk);

assign	w_1 = ~(w_8 & w_9);

assign	w_3 = ~(w_4 & w_10);

assign	w_9 = ~(w_10 & w_6);


endmodule
