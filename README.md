# Dual-Dice-Game
Computer Architecture and Design using HDL(VHDL) lab experiment

This is a two stage dual-dice-game. The stage will be decided based upon the sum obtained after rolling the dual dice.
Since we are talking about a dual dice therefore the range of the sum is [2,12].

Stage 1 -->
Roll the dual dice.....
If the sum = 3,6,9 (Winner Winner Chicken Dinner, wanna play again) ;
If the sum = 2,8,11 (Oops better luck next time, wanna play again??) ;
If the sum = other than the above two sets, store the sum in variable named (old_sum) and enter stage-2.

Stage 2-->
Roll the dual dice again.....
If the sum = oldsum (Winner Winner Chicken Dinner, wanna play again) ;
If the sum = 3,6,9 (Oops better luck next time, wanna play again??) ;
If the sum = other than the above two sets, repeat step 2 before which don't forget to update the (old_sum) variable. ### ;)
