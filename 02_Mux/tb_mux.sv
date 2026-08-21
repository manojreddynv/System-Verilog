module tb_mux;

    logic a;
    logic b;
    logic sel;
    logic y;

    mux dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin

        a = 0; b = 1; sel = 0;
        #10;
        $display("a=%b b=%b sel=%b y=%b", a, b, sel, y);

        a = 0; b = 1; sel = 1;
        #10;
        $display("a=%b b=%b sel=%b y=%b", a, b, sel, y);

        a = 1; b = 0; sel = 0;
        #10;
        $display("a=%b b=%b sel=%b y=%b", a, b, sel, y);

        a = 1; b = 0; sel = 1;
        #10;
        $display("a=%b b=%b sel=%b y=%b", a, b, sel, y);

        $finish;

    end

endmodule