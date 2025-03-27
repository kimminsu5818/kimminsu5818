module Adder #(parameter N = 4) (
    /*AUTOARG*/
    // Outputs
    output [N:0]   R,
    // Inputs
    input  [N-1:0] A,
    input  [N-1:0] B
);
    // 내부 캐리 신호: C[0]는 초기 캐리, C[N]은 최종 캐리
    wire [N:0] C;
    assign C[0] = 1'b0;       // 초기 캐리 0

    genvar i;
    generate 
        for (i = 0; i < N; i = i + 1) begin: bit
            // 각 비트에 대해 1비트 FullAdder 인스턴스 생성
            FullAdder fa_inst (
                /*AUTOINST*/
                // Inputs
                .a  (A[i]),
                .b  (B[i]),
                .ci (C[i]),
                // Outputs
                .r  (R[i]),
                .co (C[i+1])
            );
        end
    endgenerate

    assign R[N] = C[N];       // 최종 캐리 출력 할당
endmodule // Adder

// Local Variables:
// verilog-library-files: ("hw2_FullAdder.v")
// End:
