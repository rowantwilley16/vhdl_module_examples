-------------------------------------------------------
-- Design Name : divide_by_3 
-- File Name   : divide_by_3.vhd
-- Function    : Divide By 3
-- Author 		: Rowan Twilley
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity divide_by_3 is
    port (
        cout   :out std_logic;  -- Output clock
        clk    :in  std_logic;  -- Input clock
        reset  :in  std_logic   -- Input reset
    );
end entity;

architecture rtl of divide_by_3 is
    signal pos_cnt :std_logic_vector (1 downto 0);
    signal neg_cnt :std_logic_vector (1 downto 0);
begin
    process (clk, reset) begin
        if (reset = '1') then
            pos_cnt <= (others=>'0');
        elsif (rising_edge(clk)) then
            if (pos_cnt = 2) then
                pos_cnt <= pos_cnt + 1;
            end if;
        end if;
    end process;
    
    process (clk, reset) begin
        if (reset = '1') then
            neg_cnt <= (others=>'0');
        elsif (falling_edge(clk)) then
            if (neg_cnt = 2) then
                neg_cnt <= neg_cnt + 1;
            end if;
        end if;
    end process;
    
    cout <= '1' when ((pos_cnt /= 2) and (neg_cnt /= 2)) else
            '0';
end architecture;