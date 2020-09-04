require_relative "../enumerable"

describe Enumerable do
  describe "#my_each" do
    it "should print the elements in the array" do
      expect{[1,2,5,9,7,9,10].my_each { |x| puts x}}.to output("1\n2\n5\n9\n7\n9\n10\n").to_stdout
    end

    it "should print the elements in the range" do
      expect{(1..5).my_each { |x| puts x}}.to output("1\n2\n3\n4\n5\n").to_stdout
    end

    it "should return enumerator" do
      expect((1..5).my_each).to be_an_instance_of Enumerator
    end

    it "should print elements of a hash" do
      
      expect{{ '1'=>1,'2'=>2}.my_each {|x| print x}}.to output('["1", 1]["2", 2]').to_stdout
    end

    it "should print the elements in the array of strings" do
      expect{["hello","World","Ramin","Youcef"].my_each { |x| puts x}}.to output("hello\nWorld\nRamin\nYoucef\n").to_stdout
    end

  end
  describe "#my_each_with_index" do
    it "should print the elements in the array with their indexes" do
      expect{[1,2,5,9,7,9,10].my_each_with_index { |x, index| puts x.to_s + " " + index.to_s}}.to output("1 0\n2 1\n5 2\n9 3\n7 4\n9 5\n10 6\n").to_stdout
    end

    it "should print the elements in the range with their indexes" do
      expect{(1..5).my_each_with_index { |x, index| puts x.to_s + " " + index.to_s}}.to output("1 0\n2 1\n3 2\n4 3\n5 4\n").to_stdout
    end

    it "should return enumerator" do
      expect((1..5).my_each_with_index).to be_an_instance_of Enumerator
    end

    it "should print keys, values and indexes of elements in hash" do
      expect{{ 'num1'=>21, 'num2'=>34}.my_each_with_index {|(key, value), index| puts key.to_s + ">" + value.to_s + ">" + index.to_s}}.to output("num1>21>0\nnum2>34>1\n" ).to_stdout
    end

    it "should print the elements in the array of strings with their indexes" do
      expect{["hello","World","Ramin","Youcef"].my_each_with_index { |x, index| puts x.to_s + " " + index.to_s}}.to output("hello 0\nWorld 1\nRamin 2\nYoucef 3\n").to_stdout
    end
  end

  describe "#my_select" do
    it "should return enumerator" do
      expect((1..5).my_select).to be_an_instance_of Enumerator
    end

    it "should return array containing the numbers smaller than 5" do
      expect([1,4,2,6,7,12,2,6].my_select{|x| x<5} ).to eql([1,4,2,2])
    end

    it "should return the even numbers in the range 1 to 5" do
      expect((1..5).my_select{|x| x%2==0} ).to eql([2,4])
    end

    it "shoult return an array containing the strings that are less than 4" do
      expect(%w[ramin and youcef are working here].my_select {|x| x.size <4}).to eql(["and","are"])
    end
  end

  describe "#my_all" do


    it 'should return true when the length of all the words in the array is equal or bigger than 3' do
      expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
    end

    it 'should return false when not all words have length equal or bigger than 3' do
      expect(%w[ant be cat].my_all? { |word| word.length >= 3 }).to eql(false)
    end

    it "should return true if all of the words in array have character 't', so they matches the regex " do
      expect(%w[ant tiger cat].my_all?(/t/)).to eql(true)
    end

    it "should false true if all of the words in array don't have character 't', so they matches the regex " do
      expect(%w[ant lion cat].my_all?(/t/)).to eql(false)
    end

    it 'should return true if all of the element in array are instance of Numeric class' do
      expect([1, 2i, 3.14].my_all?(Numeric)).to eql(true)
    end

    it 'should return false if not all of the element in array are instance of Numeric class' do
      expect([1, 'lion', 3.14].my_all?(Numeric)).to eql(false)
    end

    it 'should return false if there is at least one nil or false in the array' do
      expect([false, true, 99].my_all?).to eql(false)
    end

    it 'should return false if there is at least one nil or false in the array' do
      expect([nil, 11, 99].my_all?).to eql(false)
    end

    it 'should return true if there is no nil or false in the array' do
      expect([99, true, "new"].my_all?).to eql(true)
    end

    it 'should return true if all of the elements in array are equal to 7' do
      expect([7, 7, 7, 7, 7].my_all?(7)).to eql(true)
    end

    it 'should return false if there is at least one element in the array that is different than 7' do
      expect([7, 7, 7, 3, 7].my_all?(7)).to eql(false)
    end

    it "should return true if all of the strings in the array is equal to 'adam' " do
      expect(%w[adam adam adam].my_all?('adam')).to eql(true)
    end

    it "should return false if there is at least one string in the array that is different than 'adam' " do
      expect(%w[adam adam madam].my_all?('adam')).to eql(false)
    end
  end

  describe "#my_any" do
    
  end

  describe "#my_none" do
    
  end

  describe "#my_count" do
    
  end

  describe "#my_map" do
    
  end

  describe "#my_inject" do
    
  end
end