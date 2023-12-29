module adder(input a, input b, input cin, output s, output cout);
	assign s = a^b^cin;
	assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module test;
	reg a, b, cin;
	wire s, cout;
	adder FA(a,b,cin,s,cout);
	initial 
    	  begin 
		$dumpfile("exp12.vcd");
		$dumpvars(0,test);
		a = 1;
		b = 1;
		cin = 0; #5
		a = 1;
		b = 1;
		cin = 1; #5
		a = 0;
		b = 1;
		cin = 0; #5
		#10 $finish;
	   end
endmodule