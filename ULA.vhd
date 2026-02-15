Library IEEE;
USE IEEE.std_logic_1164.all;

Entity ULA is
Port(a,b : in std_logic_vector(7 downto 0);
     s : out std_logic_vector(7 downto 0);
	  ctr : in std_logic;
	  N,Z,Ov,Cout : out std_logic
	  );
End ULA;

architecture Arq of ULA is

component MS is
Port(a,b : in std_logic;
     s,cout : out std_logic
	  );
End component;

component SC is
Port(a,b,cin : in std_logic;
     s,cout : out std_logic
	  );
End component;

signal carry : std_logic_vector(7 downto 0);
signal saida : std_logic_vector(7 downto 0);

begin

M0: SC port map (a => a(0),
                 b => b(0) xor ctr,
					  cin => ctr,
					  s => saida(0),
					  cout => carry(0));

M1: SC port map (a => a(1),
                 b => b(1) xor ctr,
					  cin => carry(0),
					  s => saida(1),
					  cout => carry(1));
					  
M2: SC port map (a => a(2),
                 b => b(2) xor ctr,
					  cin => carry(1),
					  s => saida(2),
					  cout => carry(2));

M3: SC port map (a => a(3),
                 b => b(3) xor ctr,
					  cin => carry(2),
					  s => saida(3),
					  cout => carry(3));
					  
M4: SC port map (a => a(4),
                 b => b(4) xor ctr,
					  cin => carry(3),
					  s => saida(4),
					  cout => carry(4));
					  
M5: SC port map (a => a(5),
                 b => b(5) xor ctr,
					  cin => carry(4),
					  s => saida(5),
					  cout => carry(5));

M6: SC port map (a => a(6),
                 b => b(6) xor ctr,
					  cin => carry(5),
					  s => saida(6),
					  cout => carry(6));	

M7: SC port map (a => a(7),
                 b => b(7) xor ctr,
					  cin => carry(6),
					  s => saida(7),
					  cout => carry(7));
					  
--Flags de saida da ULA					  
Cout <= carry(7);
s <= saida;
Z <= '1' when saida = "00000000" else '0';
Ov <= carry(6) xor carry(7);
N <= saida(7);
					  
end Arq;
