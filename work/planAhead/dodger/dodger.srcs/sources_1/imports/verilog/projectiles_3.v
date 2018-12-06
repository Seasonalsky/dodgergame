/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module projectiles_3 (
    input clk,
    input rst,
    output reg [59:0] coor
  );
  
  
  
  wire [(3'h4+0)-1:0] M_edUpd_out;
  reg [(3'h4+0)-1:0] M_edUpd_in;
  
  genvar GEN_edUpd0;
  generate
  for (GEN_edUpd0=0;GEN_edUpd0<3'h4;GEN_edUpd0=GEN_edUpd0+1) begin: edUpd_gen_0
    edge_detector_5 edUpd (
      .clk(clk),
      .in(M_edUpd_in[GEN_edUpd0*(1)+(1)-1-:(1)]),
      .out(M_edUpd_out[GEN_edUpd0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  reg [59:0] M_storeCoor_d, M_storeCoor_q = 1'h0;
  reg [22:0] M_upd_d, M_upd_q = 1'h0;
  
  always @* begin
    M_storeCoor_d = M_storeCoor_q;
    
    M_edUpd_in = M_upd_q[22+0-:1];
    if (M_edUpd_out == 1'h1) begin
      M_storeCoor_d = M_storeCoor_q >> 3'h6;
    end
    coor = M_storeCoor_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_storeCoor_q <= 1'h0;
    end else begin
      M_storeCoor_q <= M_storeCoor_d;
    end
    
    if (rst == 1'b1) begin
      M_upd_q <= 1'h0;
    end else begin
      M_upd_q <= M_upd_d;
    end
  end
  
endmodule
