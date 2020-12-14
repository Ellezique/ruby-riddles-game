#4 Dec 2020 video about 24 min
#We should only be calling methods etc here. 

# A class is a blueprint where we can create a supervariable containing info and methods.
#Riddle has attributes and actions: name, riddle, tips, answer, solve/not, number of games, scoring
#info about the riddle, and what action riddle does.
#PUT EACH CLASS IN THEIR OWN FILE, good for reusability

#GEMS
require("colorize")
require("lolize")
require("tty-prompt")

#access info from all other files
require_relative("./riddle.rb")
#require_relative("./easy.rb")
#require_relative("./normal.rb")
#require_relative("./hard.rb")
require_relative("./ascii.rb")


#@riddle_name
#@actual_riddle
#@first_tip
#@second_tip
#@answer
#@attempts_this_riddle 
#To create an object (aka to create an instance)

#to make array of riddles, riddles_bb = [Riddle.new("First riddle", "",""), Riddle.new("First riddle", "","")]
riddles_array = [
    first_riddle = Riddle.new(
        "First riddle. ", 
        "I speak without a mouth and hear without ears. I have no body, but I come alive with wind. What am I? ", 
        "A reflection without an image. ",
        "I can be used for navigation. ",
        "echo"
    ),
    second_riddle = Riddle.new(
        "Second riddle.",    
        "I am always hungry and will die if not fed, whatever I touch will soon turn red. ",
        "What was red is left in shades from black to white, after I left. ",
        "I require heat, fuel and oxygen. ",
        "fire"
    )]





#info an first riddle solved
    #puts first_riddle.print_progress #must use . to access info from riddles.rb
    #first_riddle.solved #If riddle solved.
    #puts first_riddle.print_progress #1 point up



#puts EasyRiddle.totalMembers accesses class method with class variable.@@
#array_riddles = []

=begin COMMENTED OUT DURING BUILD> ADD BACK IN AT END 
#WELCOME INTRO
puts "Welcome! What is your name?"
user_name = gets.chomp #this returns a string. 
sleep (1)
puts "Hello, #{user_name}. Get ready to solve some riddles! "
sleep (2)
=end

#MENU
$prompt = TTY::Prompt.new #$Global Variable
def select_option #MAIN MENU
    return $prompt.select("Choose your option:", ["Play", "Show progress info", "Score", "Exit"])
end

def select_difficulty #play submenu
    return $prompt.select("Choose your game difficulty:", ["EASY", "RECOMMENDED", "HARD"])
end

#SCORE METHODS
def score
    puts "Score"
    #see video lecutre 4 Dec 2020 from 33min. 
end
#PLAY METHODS
def play
    difficulty = select_difficulty
    puts "You have chosen to play #{difficulty} mode."
    if difficulty == "EASY"
        puts "testing"
    else
        puts "still testing"
    end
end



answer = ""
#Loop for the menu, always shows until Exit option is selected
while answer != "Exit"
    answer = select_option
    case answer
        when "Play"
            play           
        when "Show progress info"
            puts "Show progress info"
            #attr_reader 
            puts first_riddle.riddle_name #I am allowed to access the riddle name
            puts first_riddle #works here if teh def to_s (prints strings and not memory location) is used in riddles.rb.eg 3 Dec at about 45min
        when "Score"
            score
        else 
            puts "Exit"
        end
    end



    