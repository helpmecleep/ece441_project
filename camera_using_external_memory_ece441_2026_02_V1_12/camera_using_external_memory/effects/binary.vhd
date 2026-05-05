library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binary_filter is
    Port (  
            clock       : in STD_LOGIC;
            RGBin     : in STD_LOGIC_VECTOR (11 downto 0);
            BinaryOut : out STD_LOGIC_VECTOR (11 downto 0);
            ButtonUp, ButtonDown : in STD_LOGIC;
            threshold_out : out STD_LOGIC_VECTOR(31 downto 0);
            filter_select : in STD_LOGIC_VECTOR(2 downto 0);
            visible_frame : in STD_LOGIC;
            v_sync        : in STD_LOGIC
    );
end binary_filter;

architecture Behavioral of binary_filter is
    signal intensity, red_temp, blue_temp, green_temp : unsigned(3 downto 0);
    signal threshold : unsigned(3 downto 0) := to_unsigned(7, 4);
    signal upPrev: std_logic := '0';
    signal downPrev: std_logic := '0';
    signal raw_binary : STD_LOGIC_VECTOR(11 downto 0);
    signal dilation_pixel : STD_LOGIC_VECTOR(11 downto 0);
    signal erosion_pixel : STD_LOGIC_VECTOR(11 downto 0);
    signal open_pixel : STD_LOGIC_VECTOR(11 downto 0);
    signal close_pixel : STD_LOGIC_VECTOR(11 downto 0);
    signal binary_4bit : STD_LOGIC_VECTOR(3 downto 0);
begin

    dilation_filter : entity work.dilation_filter
        generic map (
            SCREEN_X_SIZE => to_unsigned(640, 11),
            SCREEN_Y_SIZE => to_unsigned(480, 10)
        )
        port map (
            video_clock => clock,
            visible_frame => visible_frame,
            v_sync => v_sync,
            binary_pixel_in => binary_4bit,
            pixel_out => dilation_pixel
        );
    erosion_filter : entity work.erosion_filter
        generic map (
            SCREEN_X_SIZE => to_unsigned(640, 11),
            SCREEN_Y_SIZE => to_unsigned(480, 10)
        )
        port map (
            video_clock => clock,
            visible_frame => visible_frame,
            v_sync => v_sync,
            binary_pixel_in => binary_4bit,
            pixel_out => erosion_pixel
        );
    -- open_filter : entity work.open_filter
    -- close_filter : entity work.close_filter
    red_temp   <= "00" & unsigned(RGBin(11 downto 10));
    green_temp <= "00" & unsigned(RGBin(7 downto 6));
    blue_temp  <= "00" & unsigned(RGBin(3 downto 2));
    intensity  <= red_temp + green_temp + blue_temp;

    process(clock)
    begin
        if rising_edge(clock) then
            if ButtonUp = '1' and upPrev = '0' then
                if threshold < to_unsigned(15, 4) then
                    threshold <= threshold + 1;
                else
                    threshold <= threshold;
                end if;
            elsif ButtonDown = '1' and downPrev = '0' then
                if threshold > to_unsigned(0, 4) then
                    threshold <= threshold - 1;
                   else
                    threshold <= threshold;            
                     end if;
            end if;
            
            upPrev <= ButtonUp;
            downPrev <= ButtonDown;
        end if;
    end process;

    raw_binary  <= (others => '0') when intensity < threshold else (others => '1');
    binary_4bit <= "0000"          when intensity < threshold else "1111";

    BinaryOut <= raw_binary     when filter_select = "000" else
             erosion_pixel  when filter_select = "001" else
             dilation_pixel when filter_select = "010" else
             raw_binary;

    threshold_out <= (31 downto 8 => '0') &
                     std_logic_vector(to_unsigned(to_integer(threshold) / 10, 4)) &
                     std_logic_vector(to_unsigned(to_integer(threshold) mod 10, 4));

end Behavioral;
