class Riddle #blueprint for each riddle
    attr_reader :riddle_name, :actual_riddle, :first_tip, :second_tip, :answer #allows me to read access this attribute outside the class and use it in index.rb
    #attr_accessor allows this to be readable and writable.
    #def initialize: all @attributes in class. Scope is limited in class.
    def initialize(riddle_name, actual_riddle, first_tip, second_tip, answer)  #no space btwn method and parenthisis
        @riddle_name = riddle_name
        @actual_riddle = actual_riddle
        @first_tip = first_tip
        @second_tip = second_tip
        @answer = answer
    #FOR EACH PARTICULAR RIDDLE BUT NOT THE TOTAL SCORES
        #@score = 0
        #@try_count = 0
        #@retry_count = 0
    end
    


#I HAVENT USED ANY OF THE METHODS BELOW
=begin
    def solved #action method in class
        puts "YAYY!! the answer is #{@answer}"
        @riddle_points += 1
        @attempts_this_riddle += 1
    end
    def not_solved #action method in class
        puts "Uh oh! You did not solve the #{@riddle_name}."
        @attempts_this_riddle += 1
    end

    def print_ladder_format
        puts "#{@riddle_name} #{@try_count} #{@retry_count} #{@riddle_points}"
        puts "TOTAL #{@score}"
    end

    def to_s #deleting print_progress and replacing to_s just allows me to print this in index saying e.g puts riddle_1
        attempts_info = "You have have attempted this riddle #{@attempts_this_riddle} times.\n".yellow
        points_info = "You have a total of #{@riddle_points} points so far.\n \n".cyan
        return attempts_info + points_info
    end
=end

end

