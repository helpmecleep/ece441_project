library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dilation_filter is
    generic (
        SCREEN_X_SIZE : UNSIGNED( 10 downto 0 );
        SCREEN_Y_SIZE : UNSIGNED( 9 downto 0 )
    );
    port (
        video_clock : in STD_LOGIC;
        visible_frame : in STD_LOGIC;
        v_sync : in STD_LOGIC;
        binary_pixel_in : in STD_LOGIC_VECTOR( 3 downto 0 );
        pixel_out : out STD_LOGIC_VECTOR( 11 downto 0 )
    );
end dilation_filter;

architecture Behavioral of dilation_filter is

-- Type definitions for line buffer and window
type dilation_line_buffer_type is array(( to_integer( SCREEN_X_SIZE ) * 3 ) - 1 downto 0 ) of STD_LOGIC_VECTOR( 3 downto 0 );
type dilation_window_3_by_3_type is array (0 to 2, 0 to 2 ) of std_logic_vector(3 downto 0);

-- Signals for line buffer and window
signal dilation_line_buffer : dilation_line_buffer_type;
signal dilation_window_3_by_3 : dilation_window_3_by_3_type;
-- Intermediate signals for dilation calculation
signal max_row0, max_row1, max_row2: std_logic_vector(3 downto 0);

-- Signals for final dilation output
signal dilation_result : std_logic_vector(3 downto 0);

function max2(a, b : std_logic_vector(3 downto 0)) return std_logic_vector is
begin
    if unsigned(a) >= unsigned(b) then
        return a;
    else
        return b;
    end if;
end function;


begin

do_dilation_shift : process( 
    video_clock,
    v_sync,
    visible_frame,
    dilation_line_buffer,
    binary_pixel_in( 3 downto 0 )
)
variable position : integer := 0;

begin
    if ( rising_edge( video_clock )) then
        if (( visible_frame = '1' ) or ( v_sync = '0' )) then
             
            for position in (( to_integer( SCREEN_X_SIZE ) * 3 ) - 1) downto 1 loop
                dilation_line_buffer( position ) <= dilation_line_buffer( position - 1 );
            end loop;
            
            if ( v_sync = '0' ) then
                dilation_line_buffer( 0 ) <= "0000";
            else
                dilation_line_buffer( 0 ) <= binary_pixel_in( 3 downto 0 );
            end if;

        end if;
    end if;
end process;

-- Row 0 of the 3x3 window  
dilation_window_3_by_3( 0, 0 ) <= dilation_line_buffer(0 + 0);
dilation_window_3_by_3( 0, 1 ) <= dilation_line_buffer(1 + 0);
dilation_window_3_by_3( 0, 2 ) <= dilation_line_buffer(2 + 0);

-- Row 1 of the 3x3 window
dilation_window_3_by_3( 1, 0 ) <= dilation_line_buffer(0 + to_integer( SCREEN_X_SIZE ));
dilation_window_3_by_3( 1, 1 ) <= dilation_line_buffer(1 + to_integer( SCREEN_X_SIZE ));
dilation_window_3_by_3( 1, 2 ) <= dilation_line_buffer(2 + to_integer( SCREEN_X_SIZE ));

-- Row 2 of the 3x3 window
dilation_window_3_by_3( 2, 0 ) <= dilation_line_buffer(0 + to_integer( SCREEN_X_SIZE ) * 2);
dilation_window_3_by_3( 2, 1 ) <= dilation_line_buffer(1 + to_integer( SCREEN_X_SIZE ) * 2);
dilation_window_3_by_3( 2, 2 ) <= dilation_line_buffer(2 + to_integer( SCREEN_X_SIZE ) * 2);

     
        
-- 
-- dilation calculation: find max of the 3x3 window
--

max_row0 <= max2(max2(dilation_window_3_by_3(0,0), dilation_window_3_by_3(0,1)), dilation_window_3_by_3(0,2));
max_row1 <= max2(max2(dilation_window_3_by_3(1,0), dilation_window_3_by_3(1,1)), dilation_window_3_by_3(1,2));
max_row2 <= max2(max2(dilation_window_3_by_3(2,0), dilation_window_3_by_3(2,1)), dilation_window_3_by_3(2,2));

dilation_result <= max2(max2(max_row0, max_row1), max_row2);

pixel_out <= dilation_result & dilation_result & dilation_result;

end Behavioral;
