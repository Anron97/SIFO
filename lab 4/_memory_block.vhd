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

LIBRARY work;

ENTITY _memory_block IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		address :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		control :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		DATA_INPUT :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DATA_OUTPUT :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END _memory_block;

ARCHITECTURE bdf_type OF _memory_block IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT lpm_rom_0
	PORT(outclock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF lpm_rom_0: COMPONENT IS true;
ATTRIBUTE noopt OF lpm_rom_0: COMPONENT IS true;

SIGNAL	c :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	c0 :  STD_LOGIC;
SIGNAL	c1 :  STD_LOGIC;
SIGNAL	c2 :  STD_LOGIC;
SIGNAL	data_in :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	data_out :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	read :  STD_LOGIC;
SIGNAL	rom_en_NEG :  STD_LOGIC;
SIGNAL	write :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 




b2v_inst1 : lpm_rom_0
PORT MAP(outclock => CLK,
		 address => address,
		 q => SYNTHESIZED_WIRE_0);


SYNTHESIZED_WIRE_2 <= NOT(rom_en_NEG);



PROCESS(SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_1)
BEGIN
if (SYNTHESIZED_WIRE_1 = '1') THEN
	data_out(3) <= SYNTHESIZED_WIRE_0(3);
ELSE
	data_out(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_1)
BEGIN
if (SYNTHESIZED_WIRE_1 = '1') THEN
	data_out(2) <= SYNTHESIZED_WIRE_0(2);
ELSE
	data_out(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_1)
BEGIN
if (SYNTHESIZED_WIRE_1 = '1') THEN
	data_out(1) <= SYNTHESIZED_WIRE_0(1);
ELSE
	data_out(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_1)
BEGIN
if (SYNTHESIZED_WIRE_1 = '1') THEN
	data_out(0) <= SYNTHESIZED_WIRE_0(0);
ELSE
	data_out(0) <= 'Z';
END IF;
END PROCESS;

read <= c1;


rom_en_NEG <= c2;



SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_2 AND read;

DATA_OUTPUT <= data_out;

END bdf_type;