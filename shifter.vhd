Library IEEE;
USE IEEE.std_logic_1164.all;

Entity shifter is
Port(a : in std_logic_vector(7 downto 0);
     s : out std_logic_vector(7 downto 0);
	  sel : in std_logic
	  );
End shifter;

architecture Arq of shifter is

begin

process(a,sel)
begin
   if sel = '0' then
	   s <=  a(6 downto 0)&'0';
	else
	   s <=  a(7)& a(7 downto 1);
	end if;
end process;

end Arq;