require 'yaml'
MESSAGES = YAML.load_file('rpssl.yml')

VALID_CHOICES = %w(rock paper scissors spock lizard)

QUICK_CHOICES = %w(r p sc sp l)

WINNER_RULES = {  'scissors': ['paper', 'lizard'],
                  'paper': ['rock', 'spock'],
                  'rock': ['lizard', 'scissors'],
                  'lizard': ['spock', 'paper'],
                  'spock': ['scissors', 'rock'] }

# define methods
def prompt(message)
  puts(message.to_s)
end

def welcome_message
  prompt(MESSAGES['welcome'])
  prompt("")
  sleep(2)
  prompt(MESSAGES['game_rules'])
  gets.chomp
end

def convert_quick_choices(input)
  case input
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'sp'
    'spock'
  when 'l'
    'lizard'
  else
    input
  end
end

def prompt_user_choice
  prompt(MESSAGES['player_selection'])
  user_choice = gets.chomp.downcase
  convert_quick_choices(user_choice)
end

def valid_user_choice(choice)
  VALID_CHOICES.include?(choice)
end

def win?(first, second)
  WINNER_RULES[first.to_sym].include?(second)
end

def display_results(user, computer)
  if win?(user, computer)
    prompt("You win!")
  elsif win?(computer, user)
    prompt("You lose, computer wins!")
  else
    prompt("It's a tie!")
  end
end

def end_game?
  prompt(MESSAGES['again'])
  again = gets.chomp
  again.downcase.start_with?('y')
end

# begin program
system('clear')

prompt(welcome_message)

system('clear')

loop do # begin main loop
  player_count = 0
  computer_count = 0

  loop do # begin match loop
    player_choice = ""
    loop do
      player_choice = prompt_user_choice

      if valid_user_choice(player_choice)
        break
      else
        prompt(MESSAGES['not_valid'])
        prompt("")
      end
    end

    prompt("")

    computer_choice = VALID_CHOICES.sample

    prompt("You choose: #{player_choice}\nComputer chooses: #{computer_choice}")

    prompt("")

    display_results(player_choice, computer_choice)

    if win?(player_choice, computer_choice)
      player_count += 1
    elsif win?(computer_choice, player_choice)
      computer_count += 1
    end

    prompt(
      "Your score is #{player_count}. Computer score is #{computer_count}."
    )

    if player_count < 3 || computer_count < 3
      prompt(MESSAGES['next_game'])
      gets.chomp
    end

    system('clear')

    if player_count == 3
      prompt(MESSAGES['player_winner'])
      prompt("")
      break
    elsif computer_count == 3
      prompt(MESSAGES['computer_winner'])
      prompt("")
      break
    end
  end # end match loop

  if end_game?
    prompt("")
    system('clear')
    next
  else
    break
  end
end # end main looop

prompt("")

prompt(MESSAGES['goodbye'])
