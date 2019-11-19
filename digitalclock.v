`timescale 1ns/1ns

module digital_clock(
  input wire clk,
  output reg [3:0] hourst,
  output reg [3:0] hoursu,
  output reg [3:0] mint,
  output reg [3:0] minu
);
  initial begin
    hourst=0;
    hoursu=0;
    mint=0;
    minu=0;
  end
  
  always @(posedge clk) begin
    minu=minu+1;
    
    if(minu=='d10) begin
      mint=mint+1;
      minu=0;
    end
    
    if(mint=='d6) begin
        hoursu=hoursu+1;
      	mint=0;
    if(hoursu=='d10) begin
          hourst=hourst+1;
      	  hoursu=0;      
    end
	end
    if(hourst=='d2 & hoursu=='d4)
    begin
      hourst=0;
      hoursu=0;
      mint=0;
      minu=0;
    end
    
    $display("time is: %d%d:%d%d", hourst, hoursu, mint, minu);
  end
endmodule

