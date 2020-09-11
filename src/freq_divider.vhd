----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:54 09/11/2020 
-- Design Name: 
-- Module Name:    freq_divider - Behavioral 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY freq_divider IS
    PORT (
        clk_in : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        clk_out : OUT STD_LOGIC);
END freq_divider;

ARCHITECTURE Behavioral OF freq_divider IS
    SIGNAL count : INTEGER := 1;
    SIGNAL tmp : std_logic := '0';
BEGIN
    PROCESS (clk_in, reset)
    BEGIN
        IF (reset = '0') THEN
            count <= 1;
            tmp <= '0';
        ELSIF (clk_in'event AND clk_in = '1') THEN
            count <= count + 1;
            IF (count = 40000000) THEN
                tmp <= NOT tmp;
                count <= 1;
            END IF;
        END IF;
        clk_out <= tmp;
    END PROCESS;

END Behavioral;