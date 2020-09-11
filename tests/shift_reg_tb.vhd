--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:11:03 09/11/2020
-- Design Name:   
-- Module Name:   E:/Computer Architecture/L6/tests/shift_reg_tb.vhd
-- Project Name:  L6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_reg
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use std.env.finish;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY shift_reg_tb IS
END shift_reg_tb;
 
ARCHITECTURE behavior OF shift_reg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_reg
    PORT(
         Parallel_IN : IN  std_logic_vector(3 downto 0);
         LR : IN  std_logic_vector(1 downto 0);
         Load : IN  std_logic;
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Reg_out : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Parallel_IN : std_logic_vector(3 downto 0) := (others => '0');
   signal LR : std_logic_vector(1 downto 0) := (others => '0');
   signal Load : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';

	--BiDirs
   signal Reg_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_reg PORT MAP (
          Parallel_IN => Parallel_IN,
          LR => LR,
          Load => Load,
          Reset => Reset,
          Clk => Clk,
          Reg_out => Reg_out
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      Parallel_IN <= "1010";
      -- hold reset state for 12 ns.
      wait for 12 ns;

      reset <= '1';
      wait for Clk_period * 2;

      Load <= '1';
      wait for Clk_period;

      Load <= '0';
      wait for Clk_period * 2;

      LR <= "11";
      wait for Clk_period * 2;

      LR <= "01";
      wait for Clk_period * 2;

      LR <= "00";
      Load <= '1';
      wait for Clk_period;

      Load <= '0';
      wait for Clk_period * 2;

      LR <= "10";
      wait for Clk_period * 2;

      LR <= "00";
      wait for Clk_period * 2;

      finish;
   end process;

END;
