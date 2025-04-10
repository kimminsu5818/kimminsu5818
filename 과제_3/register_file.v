// register_file.v
module register_file(/*AUTOARG*/
   // Outputs
   read_data1, read_data2,
   // Inputs
   clk, rst_n, write_en, write_addr, write_data, read_addr1,
   read_addr2
   );
   input       clk, rst_n;
   input       write_en;
   input [4:0] write_addr;
   input [31:0]	write_data;
   input [4:0]	read_addr1;
   input [4:0]	read_addr2;
   output [31:0] read_data1;
   output [31:0] read_data2;

   reg [31:0]	 regs [0:31];

   integer	 i;

   always @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
	 for (i = 0; i < 32; i = i + 1)
	    regs[i] <= 32'd0;
      end else if (write_en) begin
	    regs[write_addr] <= write_data;
	 end
   end

   assign read_data1 = regs[read_addr1];
   assign read_data2 = regs[read_addr2];

endmodule // register_file
