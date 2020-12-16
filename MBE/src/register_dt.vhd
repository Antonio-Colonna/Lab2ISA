library ieee;
USE IEEE.Std_logic_1164.all;

entity register_dt is 
   
   port(
      Q : out std_logic_vector(2 downto 0);    
    Clk, reset_n, enable: in std_logic;  
      D :in  std_logic_vector(2 downto 0)    
   );
end register_dt;
architecture Behavioral of register_dt is  
begin  
 process(Clk,reset_n)
 begin 
	if(reset_n = '0') then
		Q <= (others => '0');
    elsif(rising_edge(Clk)) then
		if enable = '1' then	
			Q <= D;
		end if;
    end if;      
 end process;  
end Behavioral; 