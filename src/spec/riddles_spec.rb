require_relative '../riddle'
require_relative '../index'

describe Riddle do
    it "should return the answer to the riddle"
        riddle_name = "test riddle name"
        actual_riddle = "test riddle"
        first_tip = "test 1st tip"
        second_tip = "test 2nd tip"
        answer = "test answer"    
        riddle1 = Riddle.new(riddle_name, actual_riddle, first_tip, second_tip, answer)
        expect(riddle1.answer).to eq(answer)
    end
end

describe "play_mode" do
    it "should return the difficulty mode tries variable"
        difficulty = "EASY"
        expect ($t).to be(3)
    end
end