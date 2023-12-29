module rshift (input clk, input clrb, input sdr, output reg [3:0] q);
    always@(posedge(clk), negedge(clrb))
    if(~clrb)
        q<=4'b0000;
    else
        q<= {sdr, q [3:1]};
endmodule

module test;
    reg clk, clrb, sdr;
    wire [3:0] q;
    rshift rs (clk, clrb, sdr, q);
    initial clk=0;
    always #50 clk=~clk;
    initial
    begin
        $dumpfile("exp9.vcd");
        $dumpvars (0, test);
        clk=1;
        clrb=0;
        sdr=1;
        #50
        clrb=1;
        sdr=1;
        #100
        sdr=0;
        #150
        $finish;
    end
endmodule
