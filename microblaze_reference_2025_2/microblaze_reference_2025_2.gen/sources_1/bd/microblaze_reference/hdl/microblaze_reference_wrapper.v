//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Thu Oct 15 11:09:48 2026
//Host        : FPGAbox running 64-bit Ubuntu 24.04.4 LTS
//Command     : generate_target microblaze_reference_wrapper.bd
//Design      : microblaze_reference_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module microblaze_reference_wrapper
   (leds_4bits_tri_o,
    reset_rtl,
    rx_0,
    sys_clock,
    tx_0);
  output [3:0]leds_4bits_tri_o;
  input reset_rtl;
  input rx_0;
  input sys_clock;
  output tx_0;

  wire [3:0]leds_4bits_tri_o;
  wire reset_rtl;
  wire rx_0;
  wire sys_clock;
  wire tx_0;

  microblaze_reference microblaze_reference_i
       (.leds_4bits_tri_o(leds_4bits_tri_o),
        .reset_rtl(reset_rtl),
        .rx_0(rx_0),
        .sys_clock(sys_clock),
        .tx_0(tx_0));
endmodule
