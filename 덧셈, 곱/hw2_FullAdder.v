module FullAdder(
    /*AUTOARG*/
    // Outputs
    output co,
    output r,
    // Inputs
    input  a,
    input  b,
    input  ci
);
    // 1비트 Full Adder 로직
    assign r  = a ^ b ^ ci;
    assign co = (a & b) | (ci & (a ^ b));
endmodule // FullAdder
