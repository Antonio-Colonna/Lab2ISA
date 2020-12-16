module tb_fpmul ();

   
   wire [31:0] FP_A_i;
   wire [31:0] FP_B_i;
   wire CLK_i;
   wire RST_n_i;
   wire [31:0] FP_Z_i;
  

   clk_gen CG(.RST_n(RST_n_i),
				.CLK(CLK_i));

   data_maker SM(.CLK(CLK_i),
	         .DATA_1(FP_A_i),
		 .DATA_2(FP_B_i));

   FPmul UUT(.FP_A(FP_A_i),
	     .FP_B(FP_B_i),
	 	 .clk(CLK_i),
		 .RST_n(RST_n_i),
         .FP_Z(FP_Z_i));

endmodule

		   
