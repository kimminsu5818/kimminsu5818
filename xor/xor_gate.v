// xor_gate.v
module xor_gate (/*AUTOARG*/
   // Outputs
   output wire y,
   // Inputs
      input wire a, b
   );

    wire not_a, not_b;
    wire mux1_out, mux2_out;

    // NOT 게이트 인스턴스화
    not_gate n1 (.a(a), .y(not_a)); // a의 NOT
    not_gate n2 (.a(b), .y(not_b)); // b의 NOT

    // MUX 인스턴스화
    mux2to1 m1 (.a(not_a), .b(b), .sel(a), .y(mux1_out)); // 첫 번째 MUX
    mux2to1 m2 (.a(not_b), .b(a), .sel(b), .y(mux2_out)); // 두 번째 MUX

    // XOR 로직
    assign y = mux1_out ^ mux2_out; // XOR 연산

endmodule // xor_gate
