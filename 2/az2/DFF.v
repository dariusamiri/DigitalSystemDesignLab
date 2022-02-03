`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:24 01/29/2022 
// Design Name: 
// Module Name:    DFF 
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
module DFF(
	D,
	clk,
	CLRN,
	Q,
	nQ
);


input wire	D;
input wire	clk;
input wire	CLRN;
output wire	Q;
output wire	nQ;

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

assign	Q = w_7;
assign	nQ = w_9;



assign	w_3 = ~(w_1 & clk);

assign	w_1 =  ~D;

assign	w_4 = ~(w_2 & CLRN & w_3);

assign	w_2 = ~(w_4 & w_5);

assign	w_5 = ~(clk & D);

assign	w_8 = ~(w_4 & w_6);

assign	w_6 =  ~clk;

assign	w_10 = ~(w_6 & w_2);

assign	w_9 = ~(w_7 & CLRN & w_8);

assign	w_7 = ~(w_9 & w_10);


endmodule
