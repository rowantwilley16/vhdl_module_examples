-------------------------------------------------------
-- File Name   	: d_latch.vhd
-- Function    	: DLATCH with async reset
-- Author 		: Rowan Twilley
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity dlatch_reset is
    port (
        data  :in  std_logic; -- Data input
        en    :in  std_logic; -- Enable input
        reset :in  std_logic; -- Reset input
        q     :out std_logic  -- Q output

    );
end entity;

architecture rtl of dlatch_reset is

begin
    process (en, reset, data) begin
        if (reset = '0') then
            q <= '0';
        elsif (en = '1') then
            q <= data;
        end if;
    end process;

end architecture;