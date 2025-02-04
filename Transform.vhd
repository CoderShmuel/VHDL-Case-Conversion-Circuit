library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Transform is

	port(
			Lcmd		:in 	std_logic;
			Ucmd		:in 	std_logic;
			Ncmd		:in 	std_logic;
			Ccmd		:in 	std_logic;
			Cin		:in 	std_logic_vector (7 downto 0);
			Result	:out 	std_logic_vector (7 downto 0)
	);

	attribute dont_touch : string;
	attribute dont_touch of Transform : entity is "true";

end entity Transform;

architecture Behavioral of Transform is
	signal 	ResultCC		:std_logic_vector (7 downto 0);
	
begin
	CC	: entity work.ChangeCase
	port map(
		Cin 		=> 	Cin,
		Result	=> 	ResultCC
	);
	
	Result	<=		Cin(7 downto 6) & '1' & Cin(4 downto 0) when Lcmd = '1' else
						Cin(7 downto 6) & '0' & Cin(4 downto 0) when Ucmd = '1' else
						Cin												 when Ncmd = '1' else
						ResultCC 										 when Ccmd = '1';
end architecture Behavioral;