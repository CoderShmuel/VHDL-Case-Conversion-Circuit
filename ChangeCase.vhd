library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ChangeCase is
	port (
			Cin		:in 		std_logic_vector(7 downto 0);
			Result	:out  	std_logic_vector(7 downto 0)
	);
		
attribute dont_touch	: string;
attribute dont_touch of ChangeCase : entity is "true";

end entity ChangeCase;

architecture Behavioral of ChangeCase is
begin
	Result <= Cin(7 downto 6) & not(Cin(5)) & Cin(4 downto 0);


end architecture Behavioral;
