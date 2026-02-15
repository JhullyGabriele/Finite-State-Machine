Library IEEE;
USE IEEE.std_logic_1164.all;

Entity Mux_41 is
Port(I0,I1,I2,I3 : in std_logic_vector(7 downto 0);
     sel : in std_logic_vector(1 downto 0);
	  Y : out std_logic_vector(7 downto 0)
	  );
End Mux_41;

architecture Arq of Mux_41 is
begin

   with sel select
	   Y <= I0 when "00",
	        I1 when "01",
			  I2 when "10",
			  I3 when others;

end Arq;