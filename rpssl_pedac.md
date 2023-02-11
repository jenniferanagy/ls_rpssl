ASSIGNMENT: ROCK PAPER SCISSORS SPOCK LIZARD

EXPECTED INPUT & OUTPUT
  Player Input:
    -prompt to select rock, paper, scissors, spock, lizard or r, p, sc, sp, l
    -prompt at the end for again? answer y or no for new match
  Computer Output:
    -display random choice of rock, paper, scissors, spock, lizard
    -display winner of each game
    -display overall winner tallies for player and computer
    -display the match winner when either player or computer reaches 3 wins
    -prompt player to play another match or end the game

RULES:
  -Scissors beats paper and lizard
  -Paper beats rock and spock
  -Rock beats lizard and scissors
  -Lizard beats spock and paper
  -Spock beats scissors and rock

REQUIREMENTS:
  -Add lizard and spock to the RPS code
  -Allow abbreviations for user selection:
    -"r" for rock
    -"p" for paper
    -"sc" for scissors
    -"sp" for spock
    -"l" for lizard
  -Display result of each game
  -Display incrementing tally of player's and computer's wins
  -Declare match winner when either player or computer reaches three wins
  -Do not add incremeting logic to display_results

CLARIFYING QUESTIONS:
  -Can player enter full name of selection or required to only enter abbreviation?
  -In method comparing player and computer selections, put logic into a collection?
  -Look up player's selection as a key in a hash?
  -Value of hash element is list of moves that player's move beats?

MENTAL MODEL OF PROBLEM:
Compare player selection against random computer selection to declare individual
game winner. Display a tally after each game showing player wins and computer
wins. Declare match winner once player or computer reaches 3 wins. 

TEST CASES:
-Enter blank selection for player input
-Try both the "y" and "n" options for again? to see that they work

DATA STRUCTURE / ALGORITHM
  -Welcome
  -Rules of the game
  -Prompt player selection:
    -Offer 5 choices: "r" rock, "p" paper, "sc" scissors, "sp" spock, "l" lizard
    -User may input abbreviated letters or word for selection
    -Downcase player input
  -Computer output:
    -Display random selection of rock, paper, scissors, spock, lizard
    -Display winner of the game using a method following rules of the game
  -Loop until player or computer wins three games:
    -Write method to break loop when either player or computer wins = 3
    -Display updated winner tally after each game: "You: 2, Computer: 0"
    -Display overall match winner, player or computer
  -Prompt play again?
    -If "y", loop back through again
    -If "n", break and display good bye message
