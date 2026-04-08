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
           BinaryOut : out STD_LOGIC_VECTOR (11 downto 0);
           ButtonUp, ButtonDown : in STD_LOGIC
    );
end binary_filter;

architecture Behavioral of binary_filter is
    signal intensity, red_temp, blue_temp, green_temp : unsigned(3 downto 0);
    signal threshold : unsigned(3 downto 0) := to_unsigned(7, 4);
begin

    red_temp   <= "00" & unsigned(RGBin(11 downto 10));
    green_temp <= "00" & unsigned(RGBin(7 downto 6));
    blue_temp  <= "00" & unsigned(RGBin(3 downto 2));
    intensity  <= red_temp + green_temp + blue_temp;

    process(ButtonUp, ButtonDown)
    begin
        if rising_edge(ButtonUp) then
            if threshold < to_unsigned(15, threshold'length) then
                threshold <= threshold + 1;
            end if;

        elsif rising_edge(ButtonDown) then
            if threshold > to_unsigned(0, threshold'length) then
                threshold <= threshold - 1;
            end if;
        end if; 
    end process;

    BinaryOut <= (others => '0') when intensity < threshold else (others => '1');

end Behavioral;
