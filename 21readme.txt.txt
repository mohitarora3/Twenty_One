				_________________________________________

				Game		of		TwentyOne
				_________________________________________


This Readme explains the R-code to play the Game of 21.

__________________

Packages Installed
__________________

No extra packages are needed to be installed in order to execute this code.


_______________________

In-Built Functions Used
_______________________

cat		:	Outputs the objects, concatenating the representations

paste   	:	Concatenate vectors after converting to character

rep		:	Replicates the values 

expand.grid	:	Creates a data frame from all combinations of the supplied vectors or factors

sample		:	Takes a sample of the specified size from the elements of x using either with or without replacement  

nrow		:	Returns a single numeric value that is the number of rows in matrix

readline	:	Reads a line from the terminal (in interactive use)

prompt		:	Passed as an argument to readline function. The string printed when prompting the user for input


___________________________

User-Defined Functions Used
___________________________

InIt()		:	This function defines suits, cards and their respective values and then builds a deck of 52 Playing cards
			in the form of a data frame with 3 entries in each of the 52 rows namely 'card','suit' and 'value'. And
			finally returns the deck.The cards with ranks 2 through 10 have point values of 2 through 10 respectively. 
			The "face" cards (Jack, Queen,King) have a point value of 10 each. The Ace is considered as 11 points.


Shuffle(deck)	:	The function randomly permute the order of the cards in the data frame.

			The 'deck' which is returned by the InIt function is passed as an argument to the function.


Deal()		:	It sets the top card to the first card in the data frame and then returns the top card in the deck. Further it 
			changes the first card index to the next card by reducing the index of each card by 1 and thereby reducing the
			length of the deck by 1 everytime the function is called.


TwentyOne()	:	It acts as a main method that creates the deck of cards and then allows the user to play the Game of 21 with a set of rules.


readcharacter()	:	Asks the user whether to 'HIT' or to 'STAY'.


probability()	:	This function tells the user the probability of getting close to the score of 21 and not going over it for every single move.
			_____

			Logic
			_____

				Variables Defined :
					
					req_value	:	calculates the value required to get to the score of 21 after subtracting score from 21
					count		:	the number of values that can push user closer to 21 but not over it.
					prob		:	the probability of user to get close to the score of 21

				Formula Used :

								     count
						prob	=	________________

								   nrow(deck)

						where nrow(deck) gives the number of cards left in the deck 

				Note: The Ace is considered as 11 points, unless that puts the player over a total of 21 points, in which case it reverts
				      to 1 point instead.


AddScore(score)	:	Calculates the score of the User by adding the face value of the top card to the score and returns the updated score.

			Note: The Ace is considered as 11 points, unless that puts the player over a total of 21 points, in which case it reverts to 
			      1 point instead.


_______________________________

TwentyOne() : The Main Function 
_______________________________

	Variables Defined:

		score		:	 The total score of the user after every deal.
		comp_score	:	 Computer's score.
	______________
	
	Algorithm Used
	______________

	
		1. Game Starts! It's User's Turn First.	
	
		2. The deck is initialised with the InIt function which returns the deck in the form of a dataframe.

		3. The deck of cards are then shuffled randomly.

		4. The Deal() function is called twice and the score of the User is calculated by defining AddScore function.

		5. The probability() and readcharacter() are defined to show the probability of the user to get to the score of 21 and then User is then asked 
		   whether he/she wants to 'HIT' or to 'STAY' at that score respectively.

		6. If the user's score is less than or equal to 21, the user is asked to 'HIT' or 'STAY'. 

			If user chooses to 'HIT' then the Deal() is executed and the User's score is updated through AddScore(). This process continues (repeat loop)
			till the time User chooses to 'STAY' or the score exceeds 21 .

			If the score exceeds 21 then the User loses the game and the loop breaks.

			But if the User chooses to 'STAY' with a total score less than or equal to 21 then computer plays.
			The computer starts with the next two cards of the deck. The computer automatically 'HITS' until its score is at least 17. If the computer
			goes over 21 (but the user did not), then the user wins automatically. Otherwise, the winner is the player with the higher score. A tie 
			(same total score) is won by the computer. And then the loop breaks.
			

		   Note: (a) The loop used for this step is repeat.

			 (b) Input other than 'HIT' or 'STAY' (either all lowercase or uppercase) flags an error and the user is asked for the input again.

		7. The User is now asked whether he/she wants to PLAY AGAIN (Y/N).

			If the user inputs 'Y', then the function TwentyOne() is called and steps 1-7 are repeated till the time user wants to play.

			If the user inputs 'N', then the loop breaks and the User quits the game. 

			Note: (a) The loop used for this step is repeat.
 
			      (b) Input other than 'Y' or 'N' (either all lowercase or uppercase) flags an error and the user is asked for the input again.


__________________

Project Challenges
__________________

	The main challenge in this project was to access and update the initialised variables (like deck, top) globally.

	By using '<<-' operator the defined variables becomes global and can be accessed anywhere you wish to use them.

_______

Results
_______

	This game is just for entertainment purpose only. It's main objective is to bring a smile on your face. :)


							THANK YOU!

______________________________________________________________________________________________________________________________________________________________________________________________ 