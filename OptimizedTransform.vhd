library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity OptimizedTransform is
	port(
			Lcmd	:in	std_logic;
			Ucmd	:in	std_logic;
			Ncmd	:in	std_logic;
			Ccmd	:in	std_logic;
			Cin	:in	std_logic_vector(7 downto 0);
			Result:out	std_logic_vector(7 downto 0)
	);
	
	attribute dont_touch : string;
	attribute dont_touch of OptimizedTransform: entity is "true"; 
	
end entity OptimizedTransform;

architecture Behavioral of OptimizedTransform is
--	signal 	ResultCC 	:	std_logic_vector (7 downto 0);
	

begin
	CC	: entity work.ChangeCase
	port map(
		Cin		=>		Cin,
		Result	=> 	ResultCC
	);

--	Result	<=	Cin(7 downto 6)	&
--					(Lcmd or (Ncmd and Cin(5)) or (Ccmd and ResultCC(5)))	&
--					Cin(4 downto 0);


	Result	<=	Cin(7 downto 6)	&
					(Lcmd or (Ncmd and Cin(5)) or (Ccmd and not(Cin(5)))) 	&
					Cin(4 downto 0);


end architecture Behavioral;