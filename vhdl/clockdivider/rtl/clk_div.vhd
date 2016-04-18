library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity clk_div is
    Port (
          Clk   : in std_logic;
          rst   : in std_logic;
          op    : out std_logic
    );
end clk_div;


architecture behavioral of clk_div is

constant max_count : natural := 24000000;

begin

  process(Clk,rst)
    variable count : natural range 0 to max_count;

    begin
        if rst = '0' then
            count := 0;
            op    <= '1';
        elsif rising_edge(Clk) then
            if count < (max_count/2)-1 then
                op    <='1';
                count := count + 1;
            elsif count < max_count-1 then
                op    <='0';
                count := count + 1;
            else
                count := 0;
                op    <='1';
            end if;
     end if;

end process;

end behavioral;
