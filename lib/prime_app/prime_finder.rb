class PrimeFinder
  
  def initialize return_length = 10
    @return_length = return_length
    @list = []
  end
  
  def count
    @list.length
  end
  
  def current_position
    @current_position ||= 2
  end
  
  def current_position_is_prime?
    return false if current_position <= 1
    @list.each {|p| return false if current_position%p == 0}
    true
  end
  
  def find_next_prime
    while not current_position_is_prime?
      @current_position += 1
    end
    @list << @current_position
  end
  
  def find
    while count < @return_length
      find_next_prime
    end
    return @list
  end
  
  def create_prime_factor_multiplication_table
    first_row = [1]+@list
    @return_array = first_row.map do |row_entry|
      first_row.map do |col_entry|
        row_entry*col_entry
      end
    end
  end
  
  def print_table
    @return_array.each do |row|
      puts row.join(',')
    end
  end
  
  def find_and_print
    find
    create_prime_factor_multiplication_table
    print_table
  end
end