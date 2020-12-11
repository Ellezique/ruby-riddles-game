# A class is a blueprint where we can create a supervariable containing info and methods.
#Riddle has attributes and actions: name, riddle, tips, answer, solve/not, number of games, scoring
#info about the riddle, and what action riddle does.
#PUT EACH CLASS IN THEIR OWN FILE, good for reusability

#@riddle_name
#@actual_riddle
#@first_tip
#@second_tip
#@answer
#@number_of_attempts

#To create an object (aka to create an instance)
require_relative("./riddles.rb")
first_riddle = Riddle.new(
    "First riddle", 
    "I speak without a mouth and hear without ears. I have no body, but I come alive with wind. What am I?", 
    "A reflection without an image.",
    "I can be used for navigation.",
    "echo"
)
second_riddle = Riddle.new(
    "Second riddle",    
    "I am always hungry and will die if not fed, whatever I touch will soon turn red.",
    "What was red is left in shades from black to white, after I left",
    "I require heat, fuel and oxygen.",
    "fire"
)