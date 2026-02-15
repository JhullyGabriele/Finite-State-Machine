Library IEEE;
USE IEEE.std_logic_1164.all;

Entity Reg8 is
Port(D : in std_logic_vector(7 downto 0);
     clock,reset,carga : in std_logic;
	  Q : out std_logic_vector(7 downto 0)
	  );
End Reg8;

architecture Arq of Reg8 is
begin

process(clock,reset,carga,D)
begin
    if reset = '1' then
	    --Q <= "00000000";
		 Q <= (others => '0');
	 elsif clock'event and clock = '1' then
	    if carga = '1' then
		    Q <= D;
		 end if;
	 end if;
end process;

end Arq;