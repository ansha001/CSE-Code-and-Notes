module sr_ff (sr, clk, q, qb);
    input [1:0] sr;
    input clk;
    output reg q=1'b0;
    output reg qb;
    always@(posedge clk)
    begin
        case(sr)
            2'b00: q=q;
            2'b01: q=1'b0;
            2'b10: q=1'b1;
            2'b11: q=1'bz;
        endcase
        qb=~q;
    end 
endmodule

module testbench;
    reg [1:0] a;
    reg c;
    wire x, xb;
    sr_ff srff (a, c, x, xb);
    initial c=1'b0;
    always #5 c=~c;
    initial
    begin
        $dumpfile("exp7.vcd");
        $dumpvars (0, testbench);
        a=2'b00;
        #20
        a=2'b01;
        #20
        a=2'b10;
        #20
        a=2'b11;
        #20
        $finish;
    end 
endmodule
