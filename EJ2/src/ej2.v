// Defining timescale
`timescale 100us / 100us
module test();

    wire clock, z;
    reg reset, w;
    reg chan = 0;
    // Instacnes to be used
    clock_gen #(.PERIOD(2)) my_clock(clock);
    fsm my_fsm(clock, reset, w, z);

    // Test bench
    initial begin: TEST
        w = 0;
        #2 reset = 0;
        #2 reset = 1;

        #2 w = 0;
        #2 w = 1;
        #2 w = 0;
        
        #1 $display("Input: 0-1-0. Output: %b", z);
        #3 w = 0;  //reset
        
        #6 w = 1;
        #2 w = 1;
        #2 w = 1;
        
        #1 $display("Input: 0-1-1-1. Output: %b", z);
        #3 w = 0;  //reset

        #6 w = 1;
        #2 w = 1;
        #2 w = 0;
        #2 w = 1;
        
        #1 $display("Input: 0-1-1-0-1. Output: %b", z);
        #3 w = 0;  //reset
        
        #6 w = 1;
        #2 w = 1;
        #2 w = 1;
        #2 w = 0;
        #2 w = 1;
        
        #1 $display("Input: 0-1-1-1-0-1. Output: %b", z);
        #3 w = 0;  //reset
        
        #6 w = 1;
        #2 w = 1;
        #2 w = 1;
        #2 w = 0;
        #2 w = 0;
        
        #1 $display("Input: 0-1-1-1-0-0. Output: %b", z);
        #1
        
        #5

        $finish;
    end

    // Gtkwave file creation
    initial begin: GTKWAVE_FILE
        $dumpfile("bin/output.vcd");
        $dumpvars(0, test);
    end
endmodule