library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RNG_TEST is
    Port ( en : in  STD_LOGIC;
           rn : out  std_logic_vector(3 downto 0));
end RNG_TEST;

architecture Behavioral of RNG_TEST is
--variable y:integer:=0;
begin
	process(en)
	variable count : STD_LOGIC_VECTOR (3 downto 0) := "1001";  -- Initail feed to the LFSR
	variable x : STD_LOGIC := '0';
	
	begin
			if(en = '1') then
				rn <= count;
			else
				x := count(1) xor count(0);
				count := x & count(3 downto 1);
			end if;
	end Process;
	--rn <= y;
	
end Behavioral;