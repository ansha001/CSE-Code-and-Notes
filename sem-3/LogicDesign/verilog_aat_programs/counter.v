module counter (count, rst, clk);
    input rst, clk;
    output reg [2:0] count;
    always@ (posedge clk)
    if(rst)
        count<=3'b111;
    else
        count<=count-1;
endmodule

module testbench;
    reg r, c;
    wire [2:0] ct;
    counter countbeh (ct, r, c);
    initial
    begin
        $dumpfile("exp10.vcd");
        $dumpvars (0, testbench);
        r=1;
        c=0;
        #100
        r=0;
        #200
        $finish;
    end
    always #5 c=~c;
endmodule
