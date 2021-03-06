/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module display_1 (
    input clk,
    input rst,
    input [1583:0] mapArr,
    output reg datalines
  );
  
  
  
  reg [22:0] M_counter_d, M_counter_q = 1'h0;
  
  reg [6:0] ledNo;
  
  reg [12:0] foo;
  
  always @* begin
    M_counter_d = M_counter_q;
    
    M_counter_d = M_counter_q + 1'h1;
    datalines = 1'h0;
    ledNo = M_counter_q / 12'h600;
    foo = M_counter_q - ((M_counter_q / 12'h600) * 12'h600);
    if (M_counter_q < 19'h18c00) begin
      if (mapArr[(ledNo)*24+(5'h17 - (foo >> 3'h6))*1+0-:1] == 1'h0) begin
        if (foo[0+5-:6] < 5'h14) begin
          datalines = 1'h1;
        end
      end else begin
        if (foo[0+5-:6] < 6'h28) begin
          datalines = 1'h1;
        end
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule
