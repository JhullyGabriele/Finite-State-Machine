Library IEEE;
USE IEEE.std_logic_1164.all;

Entity MS is
Port(a,b : in std_logic;
     s,cout : out std_logic
	  );
End MS;

architecture Arq of MS is
begin
   s <= a xor b;
	cout <= a and b;
end Arq;