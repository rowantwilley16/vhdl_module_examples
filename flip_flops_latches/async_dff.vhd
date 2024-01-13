-------------------------------------------------------
-- Design Name 	: dff_async_reset
-- File Name   	: asunc_dff.vhd
-- Function    	: D flip-flop with async reset
-- Author 		: Rowan Twilley
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity dff_async_reset is
    port (
        data  :in  std_logic; -- Data input
        clk   :in  std_logic; -- Clock input
        reset :in  std_logic; -- Reset input
        q     :out std_logic  -- Q output

    );
end entity;

architecture rtl of dff_async_reset is

begin
    process (clk, reset) begin
        if (reset = '0') then
            q <= '0';
        elsif (rising_edge(clk)) then
            q <= data;
        end if;
    end process;

end architecture;