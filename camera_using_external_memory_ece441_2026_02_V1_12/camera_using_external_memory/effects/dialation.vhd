
-- TODO: like all of this lol, sobel code is just a copy paste of the sobel filter, but instead of doing the sobel operation, we will do dialation. So instead of multiplying the window values by the sobel kernel, we will just take the maximum value in the window and output that as the pixel value.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all; 

entity dialation is
    generic (
        SCREEN_X_SIZE : UNSIGNED( 10 downto 0 );
        SCREEN_Y_SIZE : UNSIGNED( 9 downto 0 )
    );
    port (
        video_clock : in STD_LOGIC;
        visible_frame : in STD_LOGIC;
        filter_options : in STD_LOGIC_VECTOR( 1 downto 0 );
        v_sync : in STD_LOGIC;
        binary_pixel_in : in STD_LOGIC_VECTOR( 3 downto 0 );

        structuring_element_3_by_3 : in dialation_window_3_by_3: in array (0 to 2, 0 to 2 ) of std_logic_vector(3 downto 0);
        pixel_out : out STD_LOGIC_VECTOR( 11 downto 0 )
    );
end dialation;

architecture Behavioral of dialation is

type dialation_line_buffer_type is array(( to_integer( SCREEN_X_SIZE ) * 3 ) - 1 downto 0 ) of STD_LOGIC_VECTOR( 3 downto 0 );

signal dialation_line_buffer : dialation_line_buffer_type;
signal dialation_window_3_by_3 : dialation_window_3_by_3_type;

signal temp_y_1,temp_y_2,temp_x_1,temp_x_2: std_logic_vector(5 downto 0);

signal datax,datay : std_logic_vector(6 downto 0);

signal dataxy : std_logic_vector(7 downto 0);


begin

do_dialation_shift : process( 
    video_clock,
    v_sync,
    visible_frame,
    dialation_line_buffer,
    binary_pixel_in( 3 downto 0 )
)
variable position : integer := 0;

begin
    if ( rising_edge( video_clock )) then
        if (( visible_frame = '1' ) or ( v_sync = '0' )) then
             
            for position in (( to_integer( SCREEN_X_SIZE ) * 3 ) - 1) downto 1 loop
                dialation_line_buffer( position ) <= dialation_line_buffer( position - 1 );
            end loop;
            
            if ( v_sync = '0' ) then
                dialation_line_buffer( 0 ) <= "0000";
            else
                dialation_line_buffer( 0 ) <= binary_pixel_in( 3 downto 0 );
            end if;

        end if;
    end if;
end process;

dialation_window_3_by_3( 0, 0 ) <= dialation_line_buffer( 0 + 0 );
dialation_window_3_by_3( 0, 1 ) <= dialation_line_buffer( 1 + 0 );
dialation_window_3_by_3( 0, 2 ) <= dialation_line_buffer( 2 + 0 );

dialation_window_3_by_3( 1, 0 ) <= dialation_line_buffer( 0 + 640 );
dialation_window_3_by_3( 1, 1 ) <= dialation_line_buffer( 1 + 640 );
dialation_window_3_by_3( 1, 2 ) <= dialation_line_buffer( 2 + 640 );

dialation_window_3_by_3( 2, 0 ) <= dialation_line_buffer( 0 + 1280 );
dialation_window_3_by_3( 2, 1 ) <= dialation_line_buffer( 1 + 1280 );
dialation_window_3_by_3( 2, 2 ) <= dialation_line_buffer( 2 + 1280 );

        
        
-- 
-- y direction
--

temp_y_1 <= ( "00" & dialation_window_3_by_3(0,0) )+(dialation_window_3_by_3(0,1)&"00")+( "00" & dialation_window_3_by_3(0,2)); -- winIn(0,0) + 2*winIn(0,1)+ win(0,2)
temp_y_2 <= ( "00" & dialation_window_3_by_3(2,0) )+( '0' & dialation_window_3_by_3(2,1)&'0')+( "00" & dialation    _window_3_by_3(2,2)); -- winIn(2,0) + 2*winIn(2,1)+ win(2,2)
datay <= (('0' & temp_y_2) - ( '0' & temp_y_1)) when ( temp_y_2 > temp_y_1) else (( '0' & temp_y_1) - ( '0' & temp_y_2)); -- abs((winIn(0,0) + 2*winIn(0,1)+ win(0,2))-((winIn(2,0) + 2*winIn(2,1)+ win(2,2)))

--
--  x direction
--
temp_x_1 <= ( "00" & dialation_window_3_by_3(0,0) )+( '0' & dialation_window_3_by_3(1,0) & '0' )+( "00" & dialation_window_3_by_3(2,0)); -- winIn(0,0) + 2*winIn(1,0)+ win(2,0)
temp_x_2 <= (dialation_window_3_by_3(0,2)&"00" )+( '0' & dialation_window_3_by_3(1,2) & '0' )+(dialation_window_3_by_3(2,2)&"00" ); -- winIn(0,2) + 2*winIn(1,2)+ win(2,2)
datax <= (( '0' & temp_x_2) - ( '0' & temp_x_1)) when ( temp_x_2 > temp_x_1) else (( '0' & temp_x_1) - ( '0' & temp_x_2)); -- abs(winIn(0,0) + 2*winIn(1,0)+ win(2,0))-(winIn(0,2) + 2*winIn(1,2)+ win(2,2)))
--
-- x and y
--
dataxy <= ( '0' & datay ) + ( '0' & datax );


--pixel_out <= dataxy(3 downto 0) & dataxy(3 downto 0) & dataxy(3 downto 0);
--pixel_out <= dataxy(7 downto 4) & dataxy(7 downto 4) & dataxy(7 downto 4);
----------------- filter out

pixel_out <=
        datax(6 downto 3) & datax(6 downto 3) & datax(6 downto 3)  when filter_options ="10" else
        datay(6 downto 3) & datay(6 downto 3) & datay(6 downto 3)  when filter_options ="01" else
        dataxy(7 downto 4) & dataxy(7 downto 4) & dataxy(7 downto 4)  when filter_options ="11" else
        dataxy(3 downto 0) & dataxy(3 downto 0) & dataxy(3 downto 0);




end Behavioral;
