module tb_decoder;

    logic [1:0] a;
    logic [3:0] y;

    decoder dut (
        .a(a),
        .y(y)
    );

    initial begin

        a = 2'b00;
        #10;
        $display("a=%b y=%b", a, y);

        a = 2'b01;
        #10;
        $display("a=%b y=%b", a, y);

        a = 2'b10;
        #10;
        $display("a=%b y=%b", a, y);

        a = 2'b11;
        #10;
        $display("a=%b y=%b", a, y);

        $finish;

    end

endmodule