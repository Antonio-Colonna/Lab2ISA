module tb_fpmult_p ();

   wire CLK_i;
   wire [31:0] FP_A_i;
   wire [31:0] FP_Z_i;


   clk_gen CG(.CLK(CLK_i));

   data_maker SM(.CLK(CLK_i),
	         .DATA(FP_A_i));

   FPmul UUT(.FP_A (FP_A_i),
	     .FP_B(FP_A_i),
         .clk(CLK_i),
         .FP_Z(FP_Z_i));
  

endmodule

		   
