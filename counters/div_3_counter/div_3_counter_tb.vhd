-------------------------------------------------------
--  Testbench to check the divide_by_3 logic
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_textio.all;
    use std.textio.all;

entity div3_tb is
end entity;
architecture test of div3_tb is

    signal cout   :std_logic;
    signal clk    :std_logic := '1';
    signal reset  :std_logic := '1';
    
    component divide_by_3 is
    port (
        cout   :out std_logic;
        clk    :in  std_logic;
        reset  :in  std_logic
    );
    end component;
begin

    -- Generate clock
    clk   <= not clk after 10 ns;
    reset <= '0' after 20 ns;

    Inst_div3 : divide_by_3
    port map (
        cout   => cout,   -- Output
        clk    => clk,    -- Input
        reset  => reset   -- Iinput
    );
end architecture;