// xor_gate_tb.v
module xor_gate_tb (/*AUTOARG*/);
    // Inputs
    reg a, b;  
    // Outputs
    wire y;

    // xor_gate 인스턴스화
   xor_gate uut (/*AUTOINST*/
		 // Outputs
		 .y			(y),
		 // Inputs
		 .a			(a),
		 .b			(b));

    initial begin
        $dumpfile("xor_gate_tb.vcd");  // VCD 파일 이름
        $dumpvars(0, xor_gate_tb);      // 모든 변수 덤프

        // 테스트 벡터
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish; // 시뮬레이션 종료
    end
endmodule // xor_gate_tb
