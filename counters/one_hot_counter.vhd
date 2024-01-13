-------------------------------------------------------
-- File Name   	: one_hot_cnt.vhd
-- Function    	: 8 bit one hot counter
-- Author 		: Rowan Twilley
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity one_hot_cnt is
    port (
        cout   :out std_logic_vector (7 downto 0);  -- Output of the counter
        enable :in  std_logic;                      -- Enable counting
        clk    :in  std_logic;                      -- Input clock
        reset  :in  std_logic                       -- Input reset
    );
end entity;

architecture rtl of one_hot_cnt is 
    signal count :std_logic_vector (7 downto 0); 
begin 
    process (clk) begin
        if (rising_edge(clk)) then 
            if (reset = '1') then 
                count <= "00000001"; 
            elsif (enable = '1') then 
                count <= (	  count(6) 
							& count(5) 
							& count(4) 
							& count(3) 
							& count(2) 
							& count(1) 
							& count(0) 
							& count(7)); 
            end if;
        end if;
    end process;
    cout <= count;
end architecture;