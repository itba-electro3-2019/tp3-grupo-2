//verilog ej2
module fsm (Clock, Resetn, i, s, l1, l2);
    input Clock, Resetn, i, s;
    output reg l1, l2;
    wire out1, no_out1;
    reg noi = 0, nos = 0, in = 0, out2 = 0, out3 = 0;
    flip_flop_T fft(in, 1'b1, out1, no_out1, Resetn);
    // As this fsm don't have a flip-flop stage we implement it directly with logic gates
    always @(i, s) begin
        noi = ~i;
        nos = ~s;
        in <= i & nos;
        out3 <= in & out1;
        out2 <= in & no_out1;
        l1 <= noi | out3;
        l2 <= noi | out2;        
    end
endmodule