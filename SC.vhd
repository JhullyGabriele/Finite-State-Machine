Library IEEE;
USE IEEE.std_logic_1164.all;

Entity SC is
Port(a,b,cin : in std_logic;
     s,cout : out std_logic
	  );
End SC;

architecture Arq of SC is
begin

s <= a xor b xor cin;
cout <= (a and b) or (a and cin) or (b and cin);

end Arq;