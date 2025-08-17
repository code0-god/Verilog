`timescale 1ns/1ps
module tb_counter;
  reg clk = 0, rst_n = 0;
  wire [3:0] q;

  counter #(.W(4)) dut(.clk(clk), .rst_n(rst_n), .q(q));

  // 파형 덤프
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_counter);
  end

  // 클럭 10ns 주기
  always #5 clk = ~clk;

  initial begin
    #12  rst_n = 1;   // reset deassert
    #200 $finish;
  end
endmodule
