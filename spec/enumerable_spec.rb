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
    
  end
  describe "#my_select" do
    
  end
  describe "#my_all" do
    
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