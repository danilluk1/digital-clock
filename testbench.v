`timescale 1ns/1ns

module digclock_TB();
  reg clk;
  wire [3:0] ht, hu, mt, mu;
  digital_clock digClock(clk,ht,hu, mt, mu);
  
  always #10 clk=~clk;
  initial
  begin
    $dumpfile("waves.vcd");
    $dumpvars(1,digclock_TB);
    clk=1;
    #70000
    $finish; 
  end
endmodule