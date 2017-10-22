-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II"
-- VERSION		"Version 9.1 Build 222 10/21/2009 SJ Web Edition"
-- CREATED		"Thu Oct 19 20:57:48 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
-- use the following when compiling in Quartus II
--LIBRARY lpm;
--USE lpm.lpm_components.all; 

-- use the following when compiling in third party tools --
-- add lpm_pack.vhd from the Quartus II library
LIBRARY work;
USE work.lpm_components.all;

ENTITY lpm_rom_0 IS 
PORT 
( 
	outclock	:	IN	 STD_LOGIC;
	address	:	IN	 STD_LOGIC_VECTOR(7 DOWNTO 0);
	q	:	OUT	 STD_LOGIC_VECTOR(3 DOWNTO 0)
); 
END lpm_rom_0;

ARCHITECTURE bdf_type OF lpm_rom_0 IS 
BEGIN 

-- instantiate LPM macrofunction 

b2v_inst1 : lpm_rom
GENERIC MAP(LPM_ADDRESS_CONTROL => "UNREGISTERED",
			LPM_FILE => "commands.hex",
			LPM_OUTDATA => "REGISTERED",
			LPM_WIDTH => 4,
			LPM_WIDTHAD => 8)
PORT MAP(outclock => outclock,
		 address => address,
		 q => q);

END bdf_type; 