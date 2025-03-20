// mux_not_gate.v
module mux2to1 (/*AUTOARG*/
   // Outputs
   y,
   // Inputs
   a, b, sel
   );

    input wire a, b, sel;  // 입력 포트 선언
    output wire y;         // 출력 포트 선언

    assign y = sel ? b : a; // MUX 로직
endmodule // mux2to1

module not_gate (/*AUTOARG*/
   // Outputs
   y,
   // Inputs
   a
   );

    input wire a;          // 입력 포트 선언
    output wire y;         // 출력 포트 선언

    assign y = ~a; // NOT 로직
endmodule // not_gate
