library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_module is
port(
    clk : in std_logic;
    rst : in std_logic;
    led : out std_logic
);
end top_module;

architecture rtl of top_module is

signal en_1hz : std_logic := '0';

begin

    u_clock_enable : entity work.clock_enable
    generic map(
        CLK_FREQ_HZ => 100_000_000,
        BLINK_FREQ_HZ => 1
    )    
    port map(
        clk => clk,
        rst => rst,
        enable => en_1hz
    );

    u_led_blink : entity work.led_blink
    port map(
        clk => clk,
        rst => rst,
        enable => en_1hz,
        led => led
    );
    
end rtl;
