-------------------------------------------------------
-- File Name   	: sync_dff.vhd
-- Function    	: D flip-flop with sync reset
-- Author 		: Rowan Twilley
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity dff_sync_reset is
    port (
        data  :in  std_logic; -- Data input
        clk   :in  std_logic; -- Clock input
        reset :in  std_logic; -- Reset input
        q     :out std_logic  -- Q output

    );
end entity;

architecture rtl of dff_sync_reset is

begin
    process (clk) begin
        if (rising_edge(clk)) then
            if (reset = '0') then
                q <= '0';
            else
                q <= data;
            end if;
        end if;
    end process;

end architecture;