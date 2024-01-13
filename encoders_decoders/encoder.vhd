-------------------------------------------------------
-- Design Name : encoder
-- File Name   : encoder.vhd
-- Function    : Encoder using a case statement
-- Author      : Rowan Twilley	
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity encoder is
    port (
        enable     :in  std_logic;                      --  Enable for the encoder
        encoder_in :in  std_logic_vector (15 downto 0); --  16-bit Input
        binary_out :out std_logic_vector (3 downto 0)   --  4 bit binary Output

    );
end entity;

architecture behavior of encoder is

begin
    process (enable, encoder_in) begin
        if (enable = '1') then
            case (encoder_in) is
                when X"0002" => binary_out <= "0001";
                when X"0004" => binary_out <= "0010";
                when X"0008" => binary_out <= "0011";
                when X"0010" => binary_out <= "0100";
                when X"0020" => binary_out <= "0101";
                when X"0040" => binary_out <= "0110";
                when X"0080" => binary_out <= "0111";
                when X"0100" => binary_out <= "1000";
                when X"0200" => binary_out <= "1001";
                when X"0400" => binary_out <= "1010";
                when X"0800" => binary_out <= "1011";
                when X"1000" => binary_out <= "1100";
                when X"2000" => binary_out <= "1101";
                when X"4000" => binary_out <= "1110";
                when X"8000" => binary_out <= "1111";
                when others  => binary_out <= "0000";
            end case;
        end if;
    end process;
end architecture;