Library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

Entity FSM is
port( 
    clk, reset : in std_logic;
    R3_zero : in std_logic;
    C : out std_logic_vector(27 downto 0)
);
end FSM;

architecture Arq of FSM is
    type estado_type is (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7);
    signal estado_atual, proximo_estado: estado_type;

begin

    process (reset, clk)
    begin
        if reset = '1' then
            estado_atual <= Q0;
        elsif rising_edge(clk) then
            estado_atual <= proximo_estado;
        end if;
    end process;

    process (estado_atual, R3_zero)
    begin
        case estado_atual is
            when Q0 =>
                C <= "0000000000000001000000000000";
                proximo_estado <= Q1;
                
            when Q1 =>
                C <= "0000000000000000001000000000";
                proximo_estado <= Q2;
                
            when Q2 =>
                C <= "0000000000000000010000000000";
                proximo_estado <= Q3;
                
            when Q3 =>
                C <= "0000000001000000100000001000";
                proximo_estado <= Q4;
                
            when Q4 =>
                C <= "1001000100010000001000000010";
                proximo_estado <= Q5;
					 
				when Q5 =>
                C <= "1000000111000001000000010000";
                proximo_estado <= Q6;
                
            when Q6 =>
                C <= "1001000100010000001000000010";
                if R3_zero = '1' then
                    proximo_estado <= Q7;
                else
                    proximo_estado <= Q5;
                end if;
                
            when Q7 =>
                C <= (others => '0');
                proximo_estado <= Q7;
                
        end case;
    end process;

end Arq;