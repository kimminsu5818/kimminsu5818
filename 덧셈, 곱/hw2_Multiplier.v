module Multiplier(
    /*AUTOARG*/
    // Outputs
    output reg signed [15:0] PRODUCT,
    // Inputs
    input  signed [7:0]  A,
    input  signed [7:0]  B
);
    // A의 각 비트에 대한 partial product 생성
    wire [15:0] partial_products[7:0];
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin: pp
            assign partial_products[i] = (A[i] ? (B << i) : 16'b0);
        end
    endgenerate

    // 모든 partial product를 합산하고 A의 부호에 따른 보정 적용
    wire signed [15:0] sum_all = partial_products[0] + partial_products[1] +
                                 partial_products[2] + partial_products[3] +
                                 partial_products[4] + partial_products[5] +
                                 partial_products[6] + partial_products[7];
    wire signed [15:0] sign_correction = (A[7] ? -(B <<< 8) : 16'sd0);
    always @(*) begin
        PRODUCT = sum_all + sign_correction;
    end
endmodule // Multiplier
