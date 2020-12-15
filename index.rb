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
$riddles_array = [
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
puts "Hello, #{user_name}. Each riddle has a one word answer. Get ready to solve some riddles!"
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

#PLAY METHODS
def play
    puts "You have #{$t} tries per riddle.".cyan
    puts "You have #{$r} retries per riddle.".cyan
    #loops and stuff go here
    $score = 0 #GIVES TOTAL SCORE
    x = 0 #number of riddle 0 - 9 
    $try_counts_array = [] #index 0, is riddle 1 etc e.g. puts total_score_array[0] is the first array score
    $retry_counts_array = []
   #LOOP PLAYING EACH RIDDLE
    while x <= 1 #number of riddles index 0,1,2...
        try_count = 0 #try_count for this riddle only
        retry_count = 0 #
        #TRY COUNT LOOP
        correct_answer = $riddles_array[x].answer
        loop do # DO LOOP WILL RUN AT LEAST ONCE.
            puts $riddles_array[x].riddle_name.magenta
            puts $riddles_array[x].actual_riddle
            # correct_answer = $riddles_array[x].answer
            user_guess = gets.chomp.downcase
            try_count += 1
            if user_guess == correct_answer 
                sleep (1)
                puts "Yes! The correct answer is #{correct_answer}.".green
                $score += 1
            else  
                puts "Nope! That is not the answer.".red
            end 
            break if user_guess == correct_answer 
            #RETRY COUNT LOOP
            if try_count >= $t && retry_count <= $r
                y = $riddles_array[x].first_tip
                while user_guess != correct_answer && retry_count < $r
                    puts "Retry.".yellow
                    puts y
                    user_guess = gets.chomp.downcase
                    retry_count += 1
                    if user_guess == correct_answer 
                        sleep (1)
                        puts "Yes! You finally got there with some help. The correct answer is #{correct_answer}.".green
                        $score += 1
                    else  
                        puts "Nope! Not even with a tip.".red
                        y = $riddles_array[x].second_tip
                    end       
                end
                #PUSH try_count and retry_count, for each riddle, so we can use that in score
                puts "Number of attempts for this riddle: #{try_count}."
                $try_counts_array.push(try_count)
                puts "Number of retries (with help) for this riddle: #{retry_count}"
                $retry_counts_array.push(retry_count)
            end
            break if try_count >= $t && retry_count <= $r
        end          
        #ON TO THE NEXT RIDDLE
        x += 1    
        puts "x is #{x}"
        puts "out of loop"
        puts "Yout total score is #{$score}. You solved #{$score} riddles. Select 'Score' in the menu to see your stats and score."
    end
end

def play_mode
    difficulty = select_difficulty
    puts "You have chosen to play #{difficulty} mode.".blue
    case difficulty
        when "EASY"
            $t = 3
            $r = 2
            play
        when "RECOMMENDED"
            $t = 2
            $r = 2
            play
        when "HARD"
            $t = 2
            $r = 0
            play
        end
end

#SCORE METHODS
def menu_score
    puts "Your total score is #{$score}. You solved #{$score} riddles.".light_green
    puts "Retry counts array: #{$retry_counts_array}.".light_blue
    puts "Try counts array: #{$try_counts_array}.".cyan
    
    #total_try_count = []
    #puts total_try_count

    #total_retry_count = []
    #puts total_retry_count
    #see video lecutre 4 Dec 2020 from 33min. 
end

#PROGRAM 
answer = ""
#Loop for the menu, always shows until Exit option is selected
while answer != "Exit"
    answer = select_option
    case answer
        when "Play"
            play_mode           
        when "Show progress info"
            puts "Show progress info"
            #attr_reader 
            puts first_riddle.riddle_name #I am allowed to access the riddle name
            puts first_riddle #works here if teh def to_s (prints strings and not memory location) is used in riddles.rb.eg 3 Dec at about 45min
        when "Score"
            menu_score
        else 
            puts "Exit"
        end
    end 
