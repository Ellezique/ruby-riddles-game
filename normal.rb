#PUT EACH CLASS IN THEIR OWN FILE, good for reusability
#3 tries, plus two tips

require_relative("./riddle.rb")
class EasyRiddle<Riddle #inherits from Riddle class. watch 3 dec first video btwn 40min and 1h40 somewhere re super, parent children classes
    #@@team_members = []  #this is a CLASS variable. Every time we have a new team member, the number increases. CLASS VARIABLE @@
    def initialize(riddle_name, actual_riddle, first_tip, second_tip, answer)
        super(riddle_name, actual_riddle, first_tip, second_tip, answer, "Easy") #can add new attributes
            @riddle_name = riddle_name
            @actual_riddle = actual_riddle
            @first_tip = first_tip
            @second_tip = second_tip
            @answer = answer
            @attempts_this_riddle = 0  #NOt in def line.I want to put this outside the class so I can have easy and hard mode allowing diff number of attempts?
            @riddle_points = 0 
           #@@team_members.push(@riddle_name) .push will push into an empty array
    end
    #def self.totalMembers #CLASS METHOD self. This makes the method accessible to a class elsewhere.
        #return @@team_members
        #puts "uoohgfdpiajdsfgp ija"
    #end
end

