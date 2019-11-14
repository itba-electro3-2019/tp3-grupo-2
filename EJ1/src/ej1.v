// Defining timescale
`timescale 100us / 100us
module test();

    wire clock, z;
    reg reset, i, s;
    wire led1, led2;
    // Instacnes to be used
    clock_gen #(.PERIOD(2)) my_clock(clock);
    fsm my_fsm(clock, reset, i, s, led1, led2);

    // Test bench
    initial begin: TEST
        #2 reset = 0;
        #2 reset = 1;

        s = 1; // First transition adjust the flip-flop T
        i = 1;
        s = 0;
        i = 1;
        
        #2 
        s = 1;
        i = 1;
        #4
        #2 $display("Conditions: S=%b, I=%b -- Plumbs: P1=%b, P2=%b", s, i, led1, led2);
        
        #2 
        s = 0;
        i = 1;
        #4
        #2 $display("Conditions: S=%b, I=%b -- Plumbs: P1=%b, P2=%b", s, i, led1, led2);
        
        #2 
        s = 1;
        i = 1;
        #4
        #2 $display("Conditions: S=%b, I=%b -- Plumbs: P1=%b, P2=%b", s, i, led1, led2);
        
        #2 
        s = 0;
        i = 1;
        #4
        #2 $display("Conditions: S=%b, I=%b -- Plumbs: P1=%b, P2=%b", s, i, led1, led2);
        
        #2 
        s = 0;
        i = 0;
        #4
        #2 $display("Conditions: S=%b, I=%b -- Plumbs: P1=%b, P2=%b", s, i, led1, led2);
        
        #2 
        s = 0;
        i = 1;
        #4
        #2 $display("Conditions: S=%b, I=%b -- Plumbs: P1=%b, P2=%b", s, i, led1, led2);
        
        #2 
        s = 0;
        i = 0;
        #4
        #2 $display("Conditions: S=%b, I=%b -- Plumbs: P1=%b, P2=%b", s, i, led1, led2);
        
        
        
        $finish;
    end

    // Gtkwave file creation
    initial begin: GTKWAVE_FILE
        $dumpfile("bin/output.vcd");
        $dumpvars(0, test);
    end
endmodule