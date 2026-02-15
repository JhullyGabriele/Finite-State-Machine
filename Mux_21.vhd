Library IEEE;
USE IEEE.std_logic_1164.all;

Entity Mux_21 is
Port(I0,I1 : in std_logic_vector(7 downto 0);
     sel : in std_logic;
	  Y : out std_logic_vector(7 downto 0)
	  );
End Mux_21;

architecture Arq of Mux_21 is
begin

   with sel select
	   Y <= I0 when '0',
	        I1 when others;

end Arq;