//verilog ej2
module fsm (Clock, Resetn, w, z);
    input Clock, Resetn, w;
    output reg z;
    reg [2:1] y = 2'b00, Y; // init y in A state
    parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b11, D = 2'b10;
    // Define the next state and output combinational circuits
    always @(w, y)
    begin
        case (y)
            A:  if (w == 1) begin
                    Y <= A; 
            end else begin
                    Y <= B;
            end
            B:  if (w == 1) begin
                    Y <= C; 
            end else begin
                    Y <= A;
            end
            C:  if (w == 1) begin
                    Y <= C;
            end else begin
                    Y <= D;
            end
            D:  if (w == 1) begin
                    Y <= B; 
            end else begin
                    Y <= A;
            end
        endcase
        z <= (y == D & w == 1); // Define output
    end
    // Define the sequential block
    always @(negedge Resetn, posedge Clock)
    begin
        if (Resetn == 0)    y <= A;
        else                y <= Y;
    end
endmodule