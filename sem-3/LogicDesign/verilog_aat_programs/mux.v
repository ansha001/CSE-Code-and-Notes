module mux4to1(i1, i2, i3, i4, sel1, sel2, op);
	input i1, i2, i3, i4, sel1, sel2;
	output op;
	wire a, b, c, d;
	and a1(a, i1, ~sel1, ~sel2);
	and a2(b, i2, ~sel1, sel2);
	and a3(c, i3, sel1, ~sel2);
	and a4(d, i4, sel1, sel2);
	or o1(op, a, b, c, d);
endmodule

module testbench;
	reg i1, i2, i3, i4, sel1, sel2;
	wire op;
	mux4to1 muxg (i1, i2, i3, i4, sel1, sel2, op);
	initial
	begin
		$dumpfile("exp4.vcd");
		$dumpvars (0, testbench);
		i1=0; i2=0; i3=0; i4=0; sel1=0; sel2=0;
		#20
		i1=1; i2=0; i3=0; i4=0; sel1=0; sel2=0;
		#20
		i1=0; i2=0; i3=0; i4=0; sel1=0; sel2=1;
		#20
		i1=0; i2=1; i3=0; i4=0; sel1=0; sel2=1;
		#20
		i1=0; i2=0; i3=0; i4=0; sel1=1; sel2=0;
		#20
		i1=0; i2=0; i3=1; i4=0; sel1=1; sel2=0;
		#20
		i1=0; i2=0; i3=0; i4=0; sel1=1; sel2=1;
		#20
		i1=0; i2=0; i3=0; i4=1; sel1=1; sel2=1;
		#20
		$finish;
	end
endmodule
