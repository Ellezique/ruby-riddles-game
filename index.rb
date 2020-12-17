#We should only be calling methods etc here. 
#PUT EACH CLASS IN THEIR OWN FILE, good for reusability

#GEMS
require("colorize")
require("lolize")
require("tty-prompt")
#ACCESS OTHER FILES
require_relative("./riddle.rb")
require_relative("./ascii.rb")

#RIDDLES
    #@riddle_name
    #@actual_riddle
    #@first_tip
    #@second_tip
    #@answer
$riddles_array = [
    first_riddle = Riddle.new(
        "First riddle. ", 
        "I speak without a mouth and hear without ears. \n I have no body, but I come alive with wind. What am I? ", 
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
    )
=begin ,
    third_riddle = Riddle.new (
        "Third riddle.",
        "Three lives have I.\n Gentle enough to soothe the skin. Light enough to caress the sky. \n Hard enough to crack rocks.",
        "It is elementary, my dear #{user_name}.",
        "I am transparent and almost colorless. My life is an endless transition between phases.",
        "water"
    ),
    fourth_riddle = Riddle.new (
        "Fourth riddle",
        "I drift forever with the current down these long canals they've made. \n Tame, yet wild, I run elusive, multitasking to your aid. \n
        Before I came, the world was darker. Colder, sometimes, rougher, true. \n But though I might make living easy, I'm good at killing people too.",
        "I flow but I am static.",
        "Positive and negative...",
        "electricity"
    ), 
    fifth_riddle = Riddle.new (
        "Fifth riddle",
        "What does man love more than life, fear more than death or mortal strife?",
        "What the poor have, the rich require, and what contented men desire.",
        "What the miser spends and the spendthrift saves, and all men carry to their graves?"
        "nothing"
    )
=end
]



#WELCOME
def welcome
    #ARGV - COMMAND LINE
    title = "Riddles" #Default. User not given option to change.    
    user_name = "Player One" #Reference to Ernest Cline novel.
    user_name = ARGV[0] if ARGV[0] #if it exists and is not nil 
    puts "Welcome to #{title}. Ready, #{user_name}!"
    #puts "What is your name?"
    #user_name = gets.chomp #this returns a string. 
    sleep (1)
    #puts "Hello, #{user_name}."
    puts "Each riddle has a one word answer. Get ready to solve some riddles!".cyan
end
#=end


#MENU
$prompt = TTY::Prompt.new 
def select_option #MAIN MENU
    return $prompt.select("Choose your option:", ["Play", "Score", "Credits", "Exit"])
end
#SUBMENU
def select_difficulty
    return $prompt.select("Choose your game difficulty:", ["EASY", "RECOMMENDED", "HARD", "Back"])
end

#PLAY METHODS
def solved_push
    $score += 1
    riddle_solved = "yes"
    $riddle_solved_array.push(riddle_solved)
end

def play
    puts "You have #{$t} tries per riddle.".cyan
    puts "You have #{$r} retries per riddle. Retries come with tips so they are only available in EASY and RECOMMENDED modes.".cyan
    $score = 0 #GIVES TOTAL SCORE
    x = 0 #number of riddle 0 - 9 
    $try_counts_array = [] #index 0, is riddle 1 etc e.g. puts total_score_array[0] is the first array score
    $retry_counts_array = []
    $riddle_solved_array = [] 
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
                solved_push 
                $try_counts_array.push(try_count)
                retry_count = " " #need to push something to empty array as a placeholder if user solves without retries.
                $retry_counts_array.push(retry_count)
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
                        solved_push
                    else  
                        puts "Nope! Not even with a tip.".red
                        y = $riddles_array[x].second_tip
                    end       
                end
                if user_guess != correct_answer
                    riddle_solved = "no"
                    $riddle_solved_array.push(riddle_solved)
                end
                #PUSH try_count and retry_count, for each riddle, so we can use that in score
                #puts "Number of attempts for this riddle: #{try_count}."
                $try_counts_array.push(try_count)
                #puts "Number of retries (with help) for this riddle: #{retry_count}"
                $retry_counts_array.push(retry_count)
            end
            break if try_count >= $t && retry_count <= $r
        end          
        #ON TO THE NEXT RIDDLE
        x += 1    
        #puts "x is #{x}"
        #puts "out of loop"
        puts "You solved #{$score} riddles."
    end
end

def play_mode
    difficulty = select_difficulty
    puts "You have chosen #{difficulty}.".blue
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
    puts "Riddle:\t\t First\t Second\t Third\t Fourth\t Fifth".magenta
    if $try_counts_array != nil  #if you have not played, the try array is empty and returns nil
        print "Try count: "
        $try_counts_array.each do |try_per_riddle|
            print "\t #{try_per_riddle}".cyan
        end
        puts ""
        print "Retry count: "
        $retry_counts_array.each do |retry_per_riddle|
            print "\t #{retry_per_riddle}".light_blue
        end
        puts ""
        print "Solved: "
        $riddle_solved_array.each do |riddle_solved|
            print "\t #{riddle_solved}".light_blue
        end
        puts "\n\nYour total score is #{$score}. You solved #{$score} riddles.\n".light_green
    else 
        puts "\nYou need to play the game before you can get a score.".cyan
    end
end


#CREDITS
def credits
    colorizer = Lolize::Colorizer.new
    colorizer.write "\n A special thanks to Susan Ng Yu, at Hobby Lark, for collecting these riddles. \n  Cheaters check out their webpage. \n   You know you want to. \n    Just go to: https://hobbylark.com/puzzles/20-Best-Riddles-Ever \n
        Another thanks to FSYMBOLS Font Generators. 
         Check out their ASCII Text Art Generator at https://fsymbols.com/generators/carty/ \n
          THANK YOU FOR PLAYING \n          
           Game by Gizelle v.Z. © 2020 \n \n"
end

#PROGRAM 
riddles_ascii
welcome
answer = ""
while answer != "Exit"
    answer = select_option
    case answer
        when "Play"
            play_ascii
            play_mode   
            game_over  
            puts "Select 'Score' in the menu to see your stats and score.".light_blue   
        when "Score"
            score_ascii
            menu_score
        when "Credits"
            credits_ascii
            credits 
        else 
            puts "Exit"
        end
    end 
