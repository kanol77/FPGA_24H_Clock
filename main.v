// Copyright (C) 2024  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"
// CREATED		"Sun Jan 12 14:21:00 2025"

module main(
	clk,
	START,
	UM,
	UG,
	digit0,
	digit1,
	digit2,
	digit3
);


input wire	clk;
input wire	START;
input wire	UM;
input wire	UG;
output wire	[6:0] digit0;
output wire	[6:0] digit1;
output wire	[6:0] digit2;
output wire	[6:0] digit3;

wire	[3:0] godz_dzie;
wire	[3:0] godz_jed;
wire	[3:0] min_dzie;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[3:0] SYNTHESIZED_WIRE_7;




assign	SYNTHESIZED_WIRE_3 =  ~UG;


debounce_pulse	b2v_indsast(
	.clk(clk),
	.slow_clk(SYNTHESIZED_WIRE_8),
	.button(SYNTHESIZED_WIRE_1),
	.pulse_out(SYNTHESIZED_WIRE_4));


debounce_pulse	b2v_indsast7(
	.clk(clk),
	.slow_clk(SYNTHESIZED_WIRE_8),
	.button(SYNTHESIZED_WIRE_3),
	.pulse_out(SYNTHESIZED_WIRE_5));

assign	SYNTHESIZED_WIRE_1 =  ~UM;


licznik_zegarowy	b2v_inst(
	.inc_min(SYNTHESIZED_WIRE_4),
	.inc_godz(SYNTHESIZED_WIRE_5),
	.inc_min_auto(SYNTHESIZED_WIRE_6),
	.start(START),
	.clk(clk),
	.godz_dzie(godz_dzie),
	.godz_jed(godz_jed),
	.min_dzie(min_dzie),
	.min_jed(SYNTHESIZED_WIRE_7));


decoderBCD	b2v_inst1(
	.BCD(SYNTHESIZED_WIRE_7),
	.seg(digit0));


decoderBCD	b2v_inst2(
	.BCD(min_dzie),
	.seg(digit1));


decoderBCD	b2v_inst3(
	.BCD(godz_jed),
	.seg(digit2));


decoderBCD	b2v_inst4(
	.BCD(godz_dzie),
	.seg(digit3));


Prescaler	b2v_inst5(
	.clk(clk),
	.start(START),
	.clock_1_60Hz(SYNTHESIZED_WIRE_6),
	.clock_1000Hz(SYNTHESIZED_WIRE_8));


endmodule
