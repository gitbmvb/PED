----------------------------------------------------------------------------------
-- Create Date: 02.01.2023
-- Design Name: Bruno Ribeiro
-- Module Name: exp_3 - Behavioral
-- Project Name: exp_3
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity exp_3 is
    Port ( a, b : in STD_LOGIC_VECTOR(4 downto 0);
           s    : in STD_LOGIC_VECTOR(1 downto 0);
           f    : out STD_LOGIC_VECTOR(4 downto 0);
           over : out STD_LOGIC);
end exp_3;

architecture Behavioral of exp_3 is
    signal sf: STD_LOGIC_VECTOR(4 downto 0);
begin
    process(a, b, s)
    begin
        case s is
            when "00" =>
                sf <= a + b;
                over <= (not a(4) and not b(4) and sf(4)) or (a(4) and b(4) and not sf(4));
                f <= sf;
            when "01" =>
                sf <= a - b;
                over <= (not a(4) and not b(4) and sf(4)) or (a(4) and b(4) and not sf(4));
                f <= sf;
            when "10" => f <= a and b;
            when "11" => f <= a or b;
        end case;
    end process;
end Behavioral;