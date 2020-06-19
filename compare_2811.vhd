library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compare_2811 is
    Port ( input_1 : in  std_logic_vector(3 downto 0);
           output  : out  std_logic);
end compare_2811;

architecture Behavioral of compare_2811 is

begin
	process(input_1)
	begin
		if (input_1 = "0010" or input_1 = "1000" or input_1 = "1011") then
			output	<=	'1';
		else
			output <=	'0';
		end if;	
	end process;

end Behavioral;

