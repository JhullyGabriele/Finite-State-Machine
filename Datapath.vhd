Library IEEE;
USE IEEE.std_logic_1164.all;

Entity Datapath is
Port(DataIn : in std_logic_vector(7 downto 0);
     C : in std_logic_vector(27 downto 0);
	  reset, clock: in std_logic;
     DataOut,R0,R1,R2,R3,R4,R5,R6,R7 : out std_logic_vector(7 downto 0);
	  N,Z,Ov,Cout : out std_logic
	  );
End Datapath;

architecture Arq of Datapath is

component Mux_21 is
Port(I0,I1 : in std_logic_vector(7 downto 0);
     sel : in std_logic;
	  Y : out std_logic_vector(7 downto 0)
	  );
End component;

component Mux_41 is
Port(I0,I1,I2,I3 : in std_logic_vector(7 downto 0);
     sel : in std_logic_vector(1 downto 0);
	  Y : out std_logic_vector(7 downto 0)
	  );
End component;

component Mux81 is
Port(I0,I1,I2,I3,I4,I5,I6,I7 : in std_logic_vector(7 downto 0);
     sel : in std_logic_vector(2 downto 0);
	  Y : out std_logic_vector(7 downto 0)
	  );
End component;

component Reg8 is
Port(D : in std_logic_vector(7 downto 0);
     clock,reset,carga : in std_logic;
	  Q : out std_logic_vector(7 downto 0)
	  );
End component;

component ULA is
Port(a,b : in std_logic_vector(7 downto 0);
     s : out std_logic_vector(7 downto 0);
	  ctr : in std_logic;
	  N,Z,Ov,Cout : out std_logic
	  );
End component;

component shifter is
Port(a : in std_logic_vector(7 downto 0);
     s : out std_logic_vector(7 downto 0);
	  sel : in std_logic
	  );
End component;

signal DataULA: std_logic_vector(7 downto 0);
signal M_0, M_1, M_2, M_3, M_4, M_5, M_6, M_7: std_logic_vector(7 downto 0);
signal q0, q1, q2, q3, q4, q5, q6, q7: std_logic_vector(7 downto 0);
signal opA, opB, opS, s_ULA, s_shifter: std_logic_vector(7 downto 0);
signal s_M11: std_logic_vector(7 downto 0);

begin

Mx0: Mux_21 port map (I0 => DataIn,
                      I1 => DataULA,
							 sel => C(0),
							 Y => M_0);

Mx1: Mux_21 port map (I0 => DataIn,
                      I1 => DataULA,
							 sel => C(1),
							 Y => M_1);
							 
Mx2: Mux_21 port map (I0 => DataIn,
                      I1 => DataULA,
							 sel => C(2),
							 Y => M_2);
							 
Mx3: Mux_21 port map (I0 => DataIn,
                      I1 => DataULA,
							 sel => C(3),
							 Y => M_3);
							 
Mx4: Mux_21 port map (I0 => DataIn,
                      I1 => DataULA,
							 sel => C(4),
							 Y => M_4);
							 
Mx5: Mux_21 port map (I0 => DataIn,
                      I1 => DataULA,
							 sel => C(5),
							 Y => M_5);
							 
Mx6: Mux_21 port map (I0 => DataIn,
                      I1 => DataULA,
							 sel => C(6),
							 Y => M_6);
							 
Mx7: Mux_21 port map (I0 => DataIn,
                      I1 => DataULA,
							 sel => C(7),
							 Y => M_7);
							 
R_0: Reg8 port map(D => M_0,
						clock => clock,
						reset => reset,
						carga => c(8),
                  q => q0);
						
R_1: Reg8 port map(D => M_1,
						clock => clock,
						reset => reset,
						carga => C(9),
                  q => q1);
						
R_2: Reg8 port map(D => M_2,
						clock => clock,
						reset => reset,
						carga => C(10),
                  q => q2);
						
R_3: Reg8 port map(D => M_3,
						clock => clock,
						reset => reset,
						carga => C(11),
                  q => q3);
						
R_4: Reg8 port map(D => M_4,
						clock => clock,
						reset => reset,
						carga => C(12),
                  q => q4);
						
R_5: Reg8 port map(D => M_5,
						clock => clock,
						reset => reset,
						carga => C(13),
                  q => q5);
						
R_6: Reg8 port map(D => M_6,
						clock => clock,
						reset => reset,
						carga => C(14),
                  q => q6);
						
R_7: Reg8 port map(D => M_7,
						clock => clock,
						reset => reset,
						carga => C(15),
                  q => q7);
						
Mx8: Mux81 port map(I0 => q0,
						  I1 => q1,
						  I2 => q2,
						  I3 => q3,
						  I4 => q4,
						  I5 => q5,
						  I6 => q6,
						  I7 => q7,
						  sel => C(18 downto 16),
						  Y => opA);
						  
Mx9: Mux81 port map(I0 => q0,
						  I1 => q1,
						  I2 => q2,
						  I3 => q3,
						  I4 => q4,
						  I5 => q5,
						  I6 => q6,
						  I7 => q7,
						  sel => C(21 downto 19),
						  Y => opB);
						  
Mx10: Mux_41 port map(I0 => q4,
						  I1 => q5,
						  I2 => q6,
						  I3 => q7,
						  sel => C(23 downto 22),
						  Y => opS);
						  
ALU: ULA port map(a => opA,
						b => opB,
						s => s_ULA,
						ctr => C(24),
						N => N,
						Z => Z,
						Ov => Ov,
					   Cout => Cout);
						
Sh: shifter port map(a => opS,
							s => s_shifter,
							sel => C(25));
							
Mx11: Mux_21 port map(I0 => s_ULA,
							 I1 => s_shifter,
							 sel => C(26),
							 Y => s_M11);
							 
Mx12: Mux_21 port map(I0 => opA,
							 I1 => s_M11,
							 sel => C(27),
							 Y => DataULA);
							 
--saídas

DataOut <= opS;
R0 <= q0;
R1 <= q1;
R2 <= q2;
R3 <= q3;
R4 <= q4;
R5 <= q5;
R6 <= q6;
R7 <= q7;


end Arq;