LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY tbmult  IS 
END ; 
 
ARCHITECTURE tbmult_arch OF tbmult IS
  --SIGNAL dout   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL x   :  std_logic_vector (31 downto 0)  ; 
  --SIGNAL ext   :  std_logic_vector (2 downto 0)  ; 
  SIGNAL a   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL res1   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL res2   :  std_logic_vector (31 downto 0)  ; 
  SIGNAL rst_n   :  std_logic  ; 
  SIGNAL clk   :  std_logic  ; 
  COMPONENT mult  
    PORT ( 
      --dout  : out std_logic_vector (31 downto 0) ; 
      x  : in std_logic_vector (31 downto 0) ; 
      --ext  : out std_logic_vector (2 downto 0) ; 
      a  : in std_logic_vector (31 downto 0) ; 
      res1  : out std_logic_vector (31 downto 0) ; 
		res2  : out std_logic_vector (31 downto 0) ; 
      rst_n  : in std_logic ; 
      clk  : in std_logic ); 
  END COMPONENT ; 
BEGIN
  DUT  : mult  
    PORT MAP ( 
      --dout   => dout  ,
      x   => x  ,
      --ext   => ext  ,
      a   => a  ,
      res1   => res1  ,
		res2   => res2  ,
      rst_n   => rst_n  ,
      clk   => clk   ) ; 



-- "Constant Pattern"
-- Start Time = 0 ns, End Time = 3 us, Period = 0 ns
  Process
	Begin
	 a  <= "11111111111111111111111111111110"  ;
	wait for 6 us ;
-- dumped values till 3 us
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ns, End Time = 3 us, Period = 0 ns
  Process
	Begin
	 x  <= "00000000000000001000000000000000"  ;
	wait for 6 us ;
-- dumped values till 3 us
	wait;
 End Process;


-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ns, End Time = 3 us, Period = 100 ns
  Process
	Begin
	 clk  <= '0'  ;
	wait for 50 ns ;
-- 50 ns, single loop till start period.
	for Z in 1 to 68
	loop
	    clk  <= '1'  ;
	   wait for 50 ns ;
	    clk  <= '0'  ;
	   wait for 50 ns ;
-- 2950 ns, repeat pattern in loop.
	end  loop;
	 clk  <= '1'  ;
	wait for 50 ns ;
-- dumped values till 3 us
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 30 ns, End Time = 3 us, Period = 0 ns
  Process
	Begin
	 rst_n  <= '0'  ;
	wait for 30 ns ;
	 rst_n  <= '1'  ;
	wait for 5970 ns ;
-- dumped values till 3 us
	wait;
 End Process;
END;
