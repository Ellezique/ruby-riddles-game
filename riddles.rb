class Riddle #blueprint for one riddle
    #def initialize: all @attributes in class. Scope is limited in class.
    def initialize (riddle_name, actual_riddle, first_tip, second_tip, answer, number_of_attempts, riddle_points)
        @riddle_name = riddle_name
        @actual_riddle = actual_riddle
        @first_tip = first_tip
        @second_tip = second_tip
        @answer = answer
        #@number_of_attempts = 0  I want to put this outside the class so I can have easy and hard mode allowing diff number of attempts
        @riddle_points = 0 #increases if def solved
    end
    def solved #action method in class
        puts "YAYY!! the answer is #{@answer}"
        @riddle_points += 1
    end
    def not_solved #action method in class
        puts "Uh oh! You did not solve the #{riddle_name}."
    end
end

#conference 3 Dec at 32min. tbc