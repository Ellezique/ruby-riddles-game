class Riddle #blueprint for each riddle
    #att_reader allows read access to these attributes outside the class and use it in index.rb
    attr_reader :riddle_name, :actual_riddle, :first_tip, :second_tip, :answer 
    #def initialize: all @attributes in class. Scope is limited in class.
    def initialize(riddle_name, actual_riddle, first_tip, second_tip, answer)
        @riddle_name = riddle_name
        @actual_riddle = actual_riddle
        @first_tip = first_tip
        @second_tip = second_tip
        @answer = answer
    end
end

