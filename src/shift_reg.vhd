----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:46:11 09/11/2020 
-- Design Name: 
-- Module Name:    shift_reg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_reg is
    Port ( Parallel_IN : in  STD_LOGIC_VECTOR(3 downto 0);
           LR : in  STD_LOGIC_VECTOR (1 downto 0);
           Load : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reg_out : inout  STD_LOGIC_VECTOR (3 downto 0));
end shift_reg;

architecture Behavioral of shift_reg is

begin

    process (Clk)
    begin
        if (reset = '0') then
			Reg_out <= "0000";
        elsif (rising_edge(Clk)) then
            if (Load = '1') then
                Reg_out <= Parallel_IN;
            else case( LR ) is
            
                    when "01" =>
                        Reg_out(2 downto 0) <= Reg_out(3 downto 1);
                        Reg_out(3) <= '0';
                    
                    when "11" =>
                        Reg_out(2 downto 0) <= Reg_out(3 downto 1);
                
                    when "10" =>
                        Reg_out(3 downto 1) <= Reg_out(2 downto 0);
                        Reg_out(0) <= '0';
                    
                    when others =>
                
                end case ;
            end if;
        end if;
    end process;

end Behavioral;

