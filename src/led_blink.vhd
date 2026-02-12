library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_toggle_enable is
port(
    clk : in std_logic;
    rst : in std_logic;
    enable : in std_logic;
    led : out std_logic
);
end led_toggle_enable;

architecture rtl of led_toggle_enable is

signal led_reg : std_logic := '0';
 

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                led_reg <= '0';
            else
                if enable = '1' then
                    led_reg <= not led_reg;
                end if;
            end if;
        end if;
    end process;
led <= led_reg;

end rtl;
