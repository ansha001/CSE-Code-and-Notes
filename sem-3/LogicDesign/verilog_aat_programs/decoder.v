module decoder2to4(s0, s1, y0, y1, y2, y3);
    input s0, s1;
    output y0, y1, y2, y3;
    wire t0, t1;
    not n1(t0, s0);
    not n2(t1, s1);
    and a1(y0, t0, t1);
    and a2(y1, t0, s1);
    and a3(y2, s0, t1);
    and a4(y3, s0, s1);
endmodule

module testbench;
    reg s0, s1;
    wire y0, y1, y2, y3;
    decoder2to4 dec (s0, s1, y0, y1, y2, y3);
    initial
    begin
        $dumpfile("exp5.vcd");
        $dumpvars (0, testbench);
        s0=0; s1=0;
        #20
        s0=0; s1=1;
        #20
        s0=1; s1=0;
        #20
        s0=1; s1=1;
        #20
        $finish;
    end
endmodule
