Library IEEE;
USE IEEE.std_logic_1164.all;

Entity RT is
Port(
    DataIn : in std_logic_vector(7 downto 0);
    reset, clock : in std_logic;
    DataOut, R0, R1, R2, R3, R4, R5, R6, R7 : out std_logic_vector(7 downto 0);
    N, Z, Ov, Cout : out std_logic
);
End RT;

architecture Arq of RT is

component Datapath is
Port(
    DataIn : in std_logic_vector(7 downto 0);
    reset, clock : in std_logic;
    C : in std_logic_vector(27 downto 0);
    DataOut, R0, R1, R2, R3, R4, R5, R6, R7 : out std_logic_vector(7 downto 0);
    N, Z, Ov, Cout : out std_logic
);
End component;

component FSM is
Port( 
    clk, reset : in std_logic;
    R3_zero : in std_logic;
    C : out std_logic_vector(27 downto 0)
);
End component;

signal s_C : std_logic_vector(27 downto 0);
signal s_R3 : std_logic_vector(7 downto 0);
signal s_R3_zero : std_logic;
signal Z_s : std_logic;

begin

DP: Datapath port map(
    DataIn => DataIn,
    reset => reset,
    clock => clock,
    C => s_C,
    DataOut => DataOut,
    R0 => R0,
    R1 => R1,
    R2 => R2,
    R3 => s_R3,
    R4 => R4,
    R5 => R5,
    R6 => R6,
    R7 => R7,
    N => N,
    Z => Z_s,
    Ov => Ov,
    Cout => Cout
);

s_R3_zero <= '1' when Z_s = '1' else '0';

controle: FSM port map(
    clk => clock,
    reset => reset,
    R3_zero => s_R3_zero,
    C => s_C
);

Z <= s_R3_zero;

End Arq;