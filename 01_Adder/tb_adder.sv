module tb_adder;

    logic [3:0] a;
    logic [3:0] b;
    logic [4:0] sum;

    adder dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin

        a = 4'd5;
        b = 4'd3;
        #10;

        $display("a = %0d, b = %0d, sum = %0d", a, b, sum);

        a = 4'd9;
        b = 4'd6;
        #10;

        $display("a = %0d, b = %0d, sum = %0d", a, b, sum);

        $finish;

    end

endmodule