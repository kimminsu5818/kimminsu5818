module testbench;
    // 테스트벤치 신호 선언
    reg  [3:0]    A_adder = 4'b0000;
    reg  [3:0]    B_adder = 4'b0000;
    wire [4:0]    R_adder;                 // 4비트 덧셈 결과 (5비트: carry 포함)

    reg  signed [7:0] A_multiplier = 8'b00000000;
    reg  signed [7:0] B_multiplier = 8'b00000000;
    wire signed [15:0] PRODUCT_multiplier; // 8비트 곱셈 결과 (16비트)

    // 4비트 덧셈기 인스턴스화
    Adder #(.N(4)) adder_inst (
        /*AUTOINST*/
        // Outputs
        .R       (R_adder),
        // Inputs
        .A       (A_adder),
        .B       (B_adder)
    );

    // 8비트 곱셈기 인스턴스화
    Multiplier multiplier_inst (
        /*AUTOINST*/
        // Outputs
        .PRODUCT (PRODUCT_multiplier),
        // Inputs
        .A       (A_multiplier),
        .B       (B_multiplier)
    );

    // 테스트 자극
    initial begin
        $dumpfile("simulation.vcd");
        $dumpvars(0, testbench);
        
        // 덧셈 테스트
        A_adder = 4'b0110;  B_adder = 4'b0011; #10;  // 6 + 3 = 9
        A_adder = 4'b1111;  B_adder = 4'b0001; #10;  // 15 + 1 = 16 (carry 발생)

        // 곱셈 테스트 (양수 및 음수 조합)
        A_multiplier = 8'b00000101; B_multiplier = 8'b00000011; #10;  //  5 *  3 = 15
        A_multiplier = 8'b11111111; B_multiplier = 8'b00000001; #10;  // -1 *  1 = -1
        A_multiplier = 8'b00001000; B_multiplier = 8'b00000010; #10;  //  8 *  2 = 16
        A_multiplier = 8'b11111100; B_multiplier = 8'b00000100; #10;  // -4 *  4 = -16

        $finish;
    end
endmodule


// Local Variables:
// verilog-library-files: ("hw2_Adder.v" "hw2_Multiplier.v")
// End:
