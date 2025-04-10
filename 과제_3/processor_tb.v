// processor_tb.v
`timescale 1ns/1ps

module processor_tb;
    reg clk, rst_n;
    reg mode;
    reg [2:0] F;
    reg [4:0] read_addr1;
    reg [4:0] read_addr2;
    reg [4:0] dest_addr;
    reg [4:0] store_addr;
    reg [31:0] store_data;

    processor processor_A(/*AUTOINST*/
			  // Inputs
			  .clk			(clk),
			  .rst_n		(rst_n),
			  .mode			(mode),
			  .F			(F[2:0]),
			  .read_addr1		(read_addr1[4:0]),
			  .read_addr2		(read_addr2[4:0]),
			  .dest_addr		(dest_addr[4:0]),
			  .store_addr		(store_addr[4:0]),
			  .store_data		(store_data[31:0]));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        $dumpfile("processor_tb.vcd");
        $dumpvars(0, processor_tb);
    end

    integer i;
    initial begin
    
        rst_n = 0;
        mode = 1'b0;
        F = 3'b000;
        read_addr1 = 5'd0;
        read_addr2 = 5'd0;
        dest_addr = 5'd0;
        store_addr = 5'd0;
        store_data = 32'd0;

        #12;
        rst_n = 1;
        mode = 1'b1;

        for (i = 0; i < 10; i = i + 1) begin
            store_addr = i + 1; 
            store_data = i + 5;  
            #10;
        end

        for (i = 0; i < 10; i = i + 1) begin
            store_addr = i + 11;      
            store_data = 15 - i;   
            #10;
        end

        mode = 1'b0; 

        for (i = 0; i < 10; i = i + 1) begin
            read_addr1 = i + 1;   
            read_addr2 = i + 11;     
            F = 3'b100;              
            dest_addr = 5'd21;        
            #10;

            read_addr1 = 5'd0;     
            read_addr2 = 5'd21;    
            F = 3'b000;              
            dest_addr = 5'd0;     
            #10;
        end // for (i = 0; i < 10; i = i + 1)

        #50; 
        $finish;
    end // initial begin
   
endmodule // processor_tb
