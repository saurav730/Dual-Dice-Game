library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
    Port ( --clk:in std_logic;
			  en  : in  STD_LOGIC;
           win,loose,play_again : out  STD_LOGIC;
			  stage_number:out std_logic_vector(1 downto 0);
			  sum_game : out std_logic_vector(3 downto 0));
end main;

architecture Behavioral of main is

type fsm is (s1,s2,s3,s4,s5,s6);
signal current_stage,next_stage:fsm:=s1;

signal control_word:std_logic_vector(5 downto 0);  

signal old_value:std_logic_vector(3 downto 0);
signal x:std_logic;
signal y:std_logic;
signal sum :std_logic_vector(3 downto 0):="0010";
signal enable : std_logic:='0';


	COMPONENT RNG_TEST
	PORT(
		en : IN std_logic;          
		rn : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
 
	COMPONENT compare_369
	PORT(
		input_1 : IN std_logic_vector(3 downto 0);          
		output : OUT std_logic
		);
	END COMPONENT;
	
	
	COMPONENT compare_2811
	PORT(
		input_1 : IN std_logic_vector(3 downto 0);          
		output : OUT std_logic
		);
	END COMPONENT;




begin
	--enable <= en;
	Inst_RNG_TEST		: RNG_TEST PORT MAP(en =>enable,rn =>sum);
	Inst_compare_369 	: compare_369 PORT MAP(input_1 => sum,output => x);
	Inst_comapre_2811 : compare_2811 PORT MAP(	input_1 => sum,output => y);

   sum_game <= sum;
	
	--process(clk)
	--		if(rising_edge(clk)) then
	--		current_stage <= next_stage;
	--	end if;
	--end process;
	
	--control_word(5) <= en;
	win <= control_word(4);
	loose <= control_word(3);
	play_again <= control_word(2);
	stage_number <= control_word(1 downto 0);
	
   process(en,x,y)
	begin
			case (current_stage) is
				
				when s1 => 
							control_word <= "000000";
							
							
							if (en = '0') then
								current_stage <= s1;
								enable <= '0';
							else 
							enable <= '1';
								if(x='1') then
									current_stage <= s2;
								
								elsif(y ='1') then 
									current_stage <= s3;
								
								else 
									old_value <= sum;
									current_stage <= s4;
								end if;
							end if;
							
							
				when s2 =>
							control_word <= "110101";
							
				when s3 =>
							control_word <= "101101";
							
				when s4	=>
							control_word <= "000001";
							
							if (en = '0') then
								enable <= '0';
								current_stage <= s4;
							else 
							enable <= '1';
								if(sum = old_value) then
									current_stage <= s5;
								elsif(x='1') then 
									current_stage <= s6;
								else 
									current_stage <= s4;
								end if;
							end if;
							
				when s5 =>
							control_word <= "110010";
				
				when s6 =>
							control_word <= "101010";
				
			end case;
								
			
	end process;



end Behavioral;

