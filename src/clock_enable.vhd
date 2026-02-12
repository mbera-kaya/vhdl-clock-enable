library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity enable_gen is
generic(
    CLK_FREQ_HZ   : integer := 100_000_000;
    BLINK_FREQ_HZ : integer := 1
);    

port(
    clk    : in  std_logic;
    rst    : in  std_logic;
    enable : out std_logic
);
end enable_gen;

architecture rtl of enable_gen is

    assert BLINK_FREQ_HZ > 0
    report "BLINK_FREQ_HZ must be greater than 0"
    severity failure;

    constant MAX_COUNT : integer := CLK_FREQ_HZ / BLINK_FREQ_HZ - 1;
    signal counter    : integer range 0 to MAX_COUNT := 0;
    signal enable_reg : std_logic := '0';

begin

    process(clk)
    begin
        if rising_edge(clk) then
          if rst = '1' then
            counter <= 0;
            enable_reg <= '0';

            else
              if counter = MAX_COUNT then    
                counter = MAX_COUNT then
                counter <= 0;
                enable_reg <= '1';  

              else
                counter <= counter + 1;
                enable_reg <= '0';
              end if;
            end if;
        end process;

    enable <= enable_reg;

end rtl;
