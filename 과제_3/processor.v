// processor.v
module processor(/*AUTOARG*/
   // Inputs
   clk, rst_n, mode, F, read_addr1, read_addr2, dest_addr, store_addr,
   store_data
   );
   input clk, rst_n;
   input mode;
   input [2:0] F;
   input [4:0] read_addr1;
   input [4:0] read_addr2;
   input [4:0] dest_addr;
   input [4:0] store_addr;
   input [31:0]	store_data;

   wire [31:0]	alu_result;
   wire [31:0]	rf_read_data1, rf_read_data2;
   reg [4:0]	write_addr; 
   reg [31:0]	write_data;
   reg		write_en;

   wire [31:0]	alu_a = rf_read_data1;
   wire [31:0]	alu_b = rf_read_data2;

   alu alu_A(/*AUTOINST*/
	     // Outputs
	     .result			(alu_result),
	     // Inputs
	     .a				(alu_a),
	     .b				(alu_b),
	     .F				(F));

   register_file register_file_A(/*AUTOINST*/
				 // Inputs
				 .clk			(clk),
				 .rst_n			(rst_n),
				 .write_en		(write_en),
				 .write_addr		(write_addr),
				 .write_data		(write_data),
				 .read_addr1		(read_addr1),
				 .read_addr2		(read_addr2),
                                 .read_data1            (rf_read_data1),
                                 .read_data2            (rf_read_data2)
                                 );

   wire [31:0] debug_total = register_file_A.regs[0];	

   always @(*) begin
      if (mode) begin
	 write_addr = store_addr;
	 write_data = store_data;
	 write_en = 1'b1;
      end else begin
	 write_addr = dest_addr;
	 write_data = alu_result;
	 write_en = 1'b1;
      end
   end // always @ (*)
   
endmodule // processor
