require_relative "./prime_app/prime_finder"

module PrimeApp
  def self.print_help
    puts "Prime Finder App!\n
         To use this app, simply run the script with a single
         integer as the argument.\n
         If run without any arguments, a default value of 10
         will be used.\n
         Example Usage:\n
            ruby ./lib/prime_app.rb 3\n
         Will Return:\n
            1,2,3,5
            2,4,6,10
            3,6,9,15
            5,10,15,25
    "
  end
  
  if ARGV.include? '--help' 
    print_help
  elsif ARGV.first.nil?
    PrimeFinder.new.find_and_print
  elsif ARGV.first.to_i == 0
    puts "Error: #{ARGV.first} is an invalid argument."
    print_help
  else
    PrimeFinder.new(ARGV.first.to_i).find_and_print
  end
end
