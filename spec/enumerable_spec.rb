require './Enumerable.rb'

describe Enumerable do
    
    describe "#my_each" do
      it "Runs thro the aray" do
        expect([1,2,3].my_each{ |item| item }).to eql([1, 2, 3])
      end
    end
  
    describe "#my_all?" do
      it "Check IF all return true to condition" do
        expect([0,2,3].my_all?{ |item| item >= 0 }).to eql(true)
        expect([1,-2,3].my_all?{ |item| item < 0 }).to eql(false)
        expect([1,-2,3].my_all?{ |item| item < 1 }).to eql(false)
      end
    end
  
    describe "#my_any?" do
      it "Check IF atleast 1 returns true to condition" do
        expect([0,2,3].my_any?{ |item| item >= 0 }).to eql(true)
        expect([1,-2,3].my_any?{ |item| item < 0 }).to eql(true)
        expect([1,2,3].my_any?{ |item| item < 0 }).to eql(false)
      end
    end
  
    describe "#my_map" do
      it "Returns modified array" do
        expect([0,2,3].my_map{ |item| item * 2 }).to eql([0,4,6])
        expect([1,-2,3].my_map{ |item| item * 3 }).to eql([3,-6,9])
        expect([1,2,3].my_map{ |item| item * 4 }).to eql([4,8,12])
      end
    end
  
    describe "#my_count" do
      it "Counts how many elements are true to passed block" do
        expect([11,5,7].my_count).to eql(3)
        expect([1,2,3,4,2.1].my_count{|item| item > 2}).to eql(3)
        expect([1,1,1.5].my_count{|item| item > 1}).to eql(1)
      end
    end


      describe "#my_inject" do
        it "Multiplies the array items" do
          expect([2,3,4].my_inject{ |memo, item| memo * item }).to eql(24)
          expect([5,2,1].my_inject{ |memo, item| memo * item }).to eql(10)
          expect([11,2,11].my_inject{ |memo, item| memo * item }).to eql(242)
          end
      end
    
  
  end