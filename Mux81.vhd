Library IEEE;
USE IEEE.std_logic_1164.all;

Entity Mux81 is
Port(I0,I1,I2,I3,I4,I5,I6,I7 : in std_logic_vector(7 downto 0);
     sel : in std_logic_vector(2 downto 0);
	  Y : out std_logic_vector(7 downto 0)
	  );
End Mux81;

architecture Arq of Mux81 is
begin

   with sel select
	   Y <= I0 when "000",
	        I1 when "001",
			  I2 when "010",
			  I3 when "011",
			  I4 when "100",
			  I5 when "101",
			  I6 when "110",
			  I7 when others;
end Arq;