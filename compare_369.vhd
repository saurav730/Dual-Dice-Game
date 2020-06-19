library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compare_369 is
    Port ( input_1 : in  std_logic_vector(3 downto 0);
           output  : out  std_logic);
end compare_369;

architecture Behavioral of compare_369 is

begin
	process(input_1)
	begin
		if (input_1 = "0011" or input_1 = "0110" or input_1 = "1001") then
			output	<=	'1';
		else
			output <=	'0';
		end if;	
	end process;

end Behavioral;

