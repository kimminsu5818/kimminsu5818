// alu.v
module alu(/*AUTOARG*/
   // Outputs
   result,
   // Inputs
   a, b, F
   );
   input [31:0] a, b;
   input [2:0]	F;
   output reg [31:0] result;

   always @(*)
     begin
	case(F)
	  3'b000: result = a + b;
	  3'b001: result = a + 32'd1;
	  3'b010: result = a - b;
	  3'b011: result = a - 32'd1;
	  3'b100: result = a * b;
	  default: result = 32'd0;
	endcase // case (f)
     end
endmodule // alu
