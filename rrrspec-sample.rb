#! /usr/bin/env rspec -c

def dice
    rand(6)+1
end

describe "random tests that will eventually pass" do

    it "should get a '1'" do
        dice.should == 1
    end

    it "should get a '2'" do
        dice.should == 2
    end

    it "should get a '3'" do
        dice.should == 3
    end
#=begin
    it "should get a '4'" do
        dice.should == 4
    end

    it "should get a '5'" do
        dice.should == 5
    end

    it "should get a '6'" do
        dice.should == 6
    end
#=end
end
