----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: Binary - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;

entity binary_filter is
    Port (  
           RGBin     : in STD_LOGIC_VECTOR (11 downto 0);
           BinaryOut : out STD_LOGIC_VECTOR (11 downto 0)
    );
end binary_filter;

architecture Behavioral of binary_filter is
    signal intensity, red_temp, blue_temp, green_temp : unsigned(3 downto 0);
    signal threshold : unsigned (3 downto 0);
begin

    red_temp   <= "00" & unsigned(RGBin(11 downto 10));
    green_temp <= "00" & unsigned(RGBin(7 downto 6));
    blue_temp  <= "00" & unsigned(RGBin(3 downto 2));
    intensity  <= red_temp + green_temp + blue_temp;
    threshold  <= "0111";

    process(intensity, threshold)
    begin
        if (intensity < unsigned(threshold)) then
            BinaryOut <= (others => '0');
        else
            BinaryOut <= (others => '1');
        end if; 
    end process;

end Behavioral;
