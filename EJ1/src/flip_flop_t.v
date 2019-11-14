//Flip flop T implementation
module flip_flop_T (Clock, T, Q, not_Q, reset);
    input Clock, T, reset;
    output reg Q, not_Q; 
    always @(negedge reset, posedge Clock) begin
        if (reset == 0) begin
            Q = 1;
            not_Q = 0;
        end 
        else if (T == 1) begin
            Q <= ~Q;
            not_Q <= Q;
        end 
    end
endmodule