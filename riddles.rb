class Riddle #blueprint for one riddle
    def initialize #all @attributes in class. Scope is limited in class.
        @riddle_name
        @actual_riddle
        @first_tip
        @second_tip
        @answer
        @number_of_attempts
    end
    def solved #action method in class
        puts "YAYY!! the answer is #{@answer}"
    end
    def not_solved #action method in class
        puts "Uh oh! You did not solve the #{riddle_name} riddle."
    end
end

