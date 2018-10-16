# Defining suits, cards and values and thereby building deck
 
InIt <- function(){ 

# Define suits, cards, values

	suits <- c("Spades", "Clubs", "Hearts", "Diamonds")
	cards <- c("Ace", "Two", "Three", "Four","Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King")
	values <- c(11, 2:9,rep(10, 4))

# Build deck

	deck <<- expand.grid(card=cards, suit=suits)
	deck$value <<- values
	return(deck)
   }

# Shuffling the deck of cards randomly

Shuffle <- function(deck){


  for (i in 1:(nrow(deck)-1))
     {
     	   j <- (sample(i:nrow(deck),1))
	   temp <- deck[i,1:3]
	   deck [i,1:3] <- deck[j,1:3]
	   deck[j,1:3] <- temp
     }
     return(deck)
    }

# Take out the Top card from the deck without replacement because shuffling always takes place before calling this function

Deal <- function(){
       
	 top <<- deck[1,1:3]
 	 deck[1:(nrow(deck)-1),1:3] <- deck[2:nrow(deck),1:3]
	 deck <<- deck[-nrow(deck),] 
	 
	 cat("\n",paste(top[1,1])," of ",paste(top[1,2]),"\t")

     }


TwentyOne <- function(){

	deck <<- InIt()

	cat("\n\nLET'S PLAY 21!\n\n")
	cat("\n\nSHUFFLING CARDS.....\n\n")

	deck <<- Shuffle(deck)

	cat("\n\nYOUR TURN!\n\n")
	Deal()

	score <<- top$value
	cat(score,"\n")

      AddScore <- function(score){

	if((top$value==11) && (score+top$value)>21)
   {
	score <- (score + (top$value - 10))
	cat(score,"\n")
	return(score)
   }
	else
   {
	score <- score + top$value
	cat(score,"\n")
	return(score)
   }
       }

	Deal()
	score <<- AddScore(score)

	readcharacter <- function()
    {
 	   n <- readline(prompt=c("\n HIT OR STAY? \t",probability()))
    }

	probability <- function() 
    {
	   req_value <<- (21-score)

	   if(req_value >= 11)
	{
		count <<- sum(deck$value<=req_value)
		prob <- count/nrow(deck)
	      cat("\n Probability of Getting Close to the Score of 21 :\t",prob,"\n")
	}	  

	   else if(req_value<11 && req_value!=0)
	{
		count <<- sum(deck$value<=req_value) + sum(deck$value==11)   
		prob <- count/nrow(deck)
		cat("\n Probability of Getting Close to the Score of 21 :\t",prob,"\n")
	} 
	   
	   else
	{
		cat("\n You Have Got to the Score of 21!\n")
	}
    }	

	repeat {   

	  if (score<=21){

 		response <- as.character(readcharacter())
	
	  	if (response == "HIT"|| response == "hit")
	    {
	    	Deal()
		score <<- AddScore(score)
	    } 

		else if (response == "STAY"|| response == "stay")
	    {
		 cat("\n\nCOMPUTER'S TURN!\n\n")
		 Deal()
		 comp_score <<- top$value
		 cat(comp_score,"\n")
	
			while(comp_score<17)
		   {
			  Deal()
			  comp_score <<- AddScore(comp_score)
		   }
			if(comp_score<score)
		   {
			  cat("\n\n YOUR SCORE : \t",score,"\n\n COMPUTER'S SCORE :\t",comp_score,"\n\n YOU WIN!\n\n")
		   }
			else if(comp_score>21)
		   {
			  cat("\n\n YOU WIN!\n\n")
		   }
			else
		   {
			  cat("\n\n YOUR SCORE : \t",score,"\n\n COMPUTER'S SCORE :\t",comp_score,"\n\n YOU LOSE!\n\n")
		   }

		 break
	    }

		else
	    {
		cat("\n\nError !!! Re-Enter the Input (HIT/STAY)...\n\n")
	    }
		}
	
	  else
 	     {		
		cat("\n\nYOU LOSE!\n\n")
		break
	     }
	}
		
	repeat
	  {
		play_more <<- as.character(readline(prompt=" PLAY AGAIN? (Y/N) "))

		if(play_more=="Y"||play_more=="y")
	    {
		  TwentyOne()
		  break
	    }
		else if(play_more=="N"||play_more=="n")
	    {
		   break
	    }
		else
	    {
		  cat("\nError !!! Re-Enter the Input (Y/N)...\n")
		
	    }
	
	  } 
}

TwentyOne()
