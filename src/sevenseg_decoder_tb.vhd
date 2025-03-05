----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2025 07:48:16 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

component top_basys3 is
    Port( seg		:	out std_logic_vector(6 downto 0);  -- seg(6) = CG, seg(0) = CA

		-- 7-segment display active-low enables (anodes)
		an      :	out std_logic_vector(3 downto 0);

		-- Switches
		sw		:	in  std_logic_vector(3 downto 0);
		
		-- Buttons
		btnC	:	in	std_logic);
end component;
--component sevenseg_decoder is
    --Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           --o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
--end component;

-- declare signals 
signal w_sw             : STD_LOGIC_VECTOR(3 downto 0);
signal w_seg            : STD_LOGIC_VECTOR(6 downto 0);
signal w_an             : STD_LOGIC_VECTOR(3 downto 0);
signal w_btnC           : STD_LOGIC;



begin
int_top_basys : top_basys3
Port map(
    sw(0) => w_sw(0),
    sw(1) => w_sw(1),
    sw(2) => w_sw(2),
    sw(3) => w_sw(3),
    seg(0) => w_seg(0),
    seg(1) => w_seg(1),
    seg(2) => w_seg(2),
    seg(3) => w_seg(3),
    seg(4) => w_seg(4),
    seg(5) => w_seg(5),
    seg(6) => w_seg(6),
    
    btnC => w_btnC,
    an(0) => w_an(0),
    an(1) => w_an(1),
    an(2) => w_an(2),
    an(3) => w_an(3)
    
    );
    
    w_an(0) <= not w_btnC;
    w_an(3 downto 1) <= (others => '1');
    

    test_process : process
    begin
    w_sw <= "0000"; w_btnC <= '1'; wait for 10 ns;
    assert(w_seg = "1000000") report "uh oh" severity warning;
    w_sw <= "0001"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "1111001") report "uh oh" severity warning;
    w_sw <= "0010"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0100100") report "uh oh" severity warning;
    w_sw <= "0011"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0110000") report "uh oh" severity warning;
    w_sw <= "0100"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0011001") report "uh oh" severity warning;
    w_sw <= "0101"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0010010") report "uh oh" severity warning;
    w_sw <= "0110"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0000010") report "uh oh" severity warning;
    w_sw <= "0111"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "1111000") report "uh oh" severity warning;
    w_sw <= "1000"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0000000") report "uh oh" severity warning;
    w_sw <= "1001"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0011000") report "uh oh" severity warning;
    w_sw <= "1010"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0001000") report "uh oh" severity warning;
    w_sw <= "1011"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0000011") report "uh oh" severity warning;
    w_sw <= "1100"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0100111") report "uh oh" severity warning;
    w_sw <= "1101"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0100001") report "uh oh" severity warning;
    w_sw <= "1110"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0000110") report "uh oh" severity warning;
    w_sw <= "1111"; w_btnC <= '1'; wait for 10 ns;            
    assert(w_seg = "0001110") report "uh oh" severity warning;
    
    
    
wait;
end process;
end Behavioral;
