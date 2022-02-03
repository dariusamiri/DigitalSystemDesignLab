`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:41:52 01/28/2022
// Design Name:   az1
// Module Name:   C:/Users/Zarineh/Desktop/1/az1/testBench.v
// Project Name:  az1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: az1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testBench;

	// Inputs
	reg [15:0] a;

	// Outputs
	wire [1:0] out;

	// Instantiate the Unit Under Test (UUT)
	az1 uut (
		.a(a), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 16'b0100010101100101;

		// Wait 100 ns for global reset to finish
		#10;
        
		a = 16'b0100010101100100;
	
		#10;
		
		a = 16'b0011001001100111;
		
		#10;
		// Add stimulus here
		$finish;
	end
      
endmodule

