library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binary_filter is
    Port (  
           clk       : in STD_LOGIC;
           RGBin     : in STD_LOGIC_VECTOR (11 downto 0);
           BinaryOut : out STD_LOGIC_VECTOR (11 downto 0);
           ButtonUp, ButtonDown : in STD_LOGIC;
           threshold_out : out STD_LOGIC_VECTOR(31 downto 0)
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

    process(clk)
    begin
        if rising_edge(clk) then
            if ButtonUp = '1' then
                if threshold < to_unsigned(15, 4) then
                    threshold <= threshold + 1;
                end if;
            elsif ButtonDown = '1' then
                if threshold > to_unsigned(0, 4) then
                    threshold <= threshold - 1;
                end if;
            end if;
        end if;
    end process;

    BinaryOut <= (others => '0') when intensity < threshold else (others => '1');

    threshold_out <= (31 downto 8 => '0') &
                     std_logic_vector(to_unsigned(to_integer(threshold) / 10, 4)) &
                     std_logic_vector(to_unsigned(to_integer(threshold) mod 10, 4));

end Behavioral;
