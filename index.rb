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
require_relative("./easy.rb")
require_relative("./normal.rb")
require_relative("./hard.rb")
require_relative("./ascii.rb")


#@riddle_name
#@actual_riddle
#@first_tip
#@second_tip
#@answer
#@attempts_this_riddle 
#To create an object (aka to create an instance)
first_riddle = Riddle.new(
    "First riddle. ", 
    "I speak without a mouth and hear without ears. I have no body, but I come alive with wind. What am I? ", 
    "A reflection without an image. ",
    "I can be used for navigation. ",
    "echo"
)
second_riddle = Riddle.new(
    "Second riddle.",    
    "I am always hungry and will die if not fed, whatever I touch will soon turn red. ",
    "What was red is left in shades from black to white, after I left. ",
    "I require heat, fuel and oxygen. ",
    "fire"
)





#info an first riddle solved
    #puts first_riddle.print_progress #must use . to access info from riddles.rb
    #first_riddle.solved #If riddle solved.
    #puts first_riddle.print_progress #1 point up
puts first_riddle #works here if teh def to_s (prints strings and not memory location) is used in riddles.rb.eg 3 Dec at about 45min

#attr_reader 
puts first_riddle.riddle_name #I am allowed to access the riddle name

#puts EasyRiddle.totalMembers accesses class method with class variable.@@

array_riddles = []

colorizer = Lolize::Colorizer.new
colorizer.write "

──────────────────────────────────────────────────────────────────────────────────────────────────────────
─████████████████───██████████─████████████───████████████───██████─────────██████████████─██████████████─
─██░░░░░░░░░░░░██───██░░░░░░██─██░░░░░░░░████─██░░░░░░░░████─██░░██─────────██░░░░░░░░░░██─██░░░░░░░░░░██─
─██░░████████░░██───████░░████─██░░████░░░░██─██░░████░░░░██─██░░██─────────██░░██████████─██░░██████████─
─██░░██────██░░██─────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██─────────██░░██─────────██░░██─────────
─██░░████████░░██─────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██─────────██░░██████████─██░░██████████─
─██░░░░░░░░░░░░██─────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██─────────██░░░░░░░░░░██─██░░░░░░░░░░██─
─██░░██████░░████─────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██─────────██░░██████████─██████████░░██─
─██░░██──██░░██───────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██─────────██░░██─────────────────██░░██─
─██░░██──██░░██████─████░░████─██░░████░░░░██─██░░████░░░░██─██░░██████████─██░░██████████─██████████░░██─
─██░░██──██░░░░░░██─██░░░░░░██─██░░░░░░░░████─██░░░░░░░░████─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
─██████──██████████─██████████─████████████───████████████───██████████████─██████████████─██████████████─
──────────────────────────────────────────────────────────────────────────────────────────────────────────
"