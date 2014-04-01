
require_relative "../lib/prime_app/prime_finder.rb"
describe PrimeFinder do
  before do
    @prime_finder = PrimeFinder.new
  end
  context "PrimeFinder.new created with default params" do
    it "should return the first 10 primes as a list" do
      @prime_finder.find.should == [2,3,5,7,11,13,17,19,23,29]
    end
  end
  context "PrimeFinder.new created with non-default lengths should return the correct list" do
    it "should return the first 20 primes as a list with return_length set to 20" do
      PrimeFinder.new(20).find.should == [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71]
    end
    it "should return the first 0 primes as a list with return_length set to 0" do
      PrimeFinder.new(0).find.should == []
    end
  end
  
  it "when PrimeFinder.print is called with default length" do
    STDOUT.should_receive(:puts).with("1,2,3,5,7,11,13,17,19,23,29")
    STDOUT.should_receive(:puts).with("2,4,6,10,14,22,26,34,38,46,58")
    STDOUT.should_receive(:puts).with("3,6,9,15,21,33,39,51,57,69,87")
    STDOUT.should_receive(:puts).with("5,10,15,25,35,55,65,85,95,115,145")
    STDOUT.should_receive(:puts).with("7,14,21,35,49,77,91,119,133,161,203")
    STDOUT.should_receive(:puts).with("11,22,33,55,77,121,143,187,209,253,319")
    STDOUT.should_receive(:puts).with("13,26,39,65,91,143,169,221,247,299,377")
    STDOUT.should_receive(:puts).with("17,34,51,85,119,187,221,289,323,391,493")
    STDOUT.should_receive(:puts).with("19,38,57,95,133,209,247,323,361,437,551")
    STDOUT.should_receive(:puts).with("23,46,69,115,161,253,299,391,437,529,667")
    STDOUT.should_receive(:puts).with("29,58,87,145,203,319,377,493,551,667,841")
    @prime_finder.find_and_print
  end
  
  it "PrimeFinder.create_prime_factor_multiplication_table should return the prime factor table" do
    @prime_finder.find
    @prime_finder.create_prime_factor_multiplication_table.should == [
      [1,2,3,5,7,11,13,17,19,23,29], 
      [2,4,6,10,14,22,26,34,38,46,58], 
      [3,6,9,15,21,33,39,51,57,69,87], 
      [5,10,15,25,35,55,65,85,95,115,145], 
      [7,14,21,35,49,77,91,119,133,161,203], 
      [11,22,33,55,77,121,143,187,209,253,319], 
      [13,26,39,65,91,143,169,221,247,299,377], 
      [17,34,51,85,119,187,221,289,323,391,493], 
      [19,38,57,95,133,209,247,323,361,437,551], 
      [23,46,69,115,161,253,299,391,437,529,667], 
      [29,58,87,145,203,319,377,493,551,667,841]
      ]
  end
end

