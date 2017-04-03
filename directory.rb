
@students = [] # an empty array accessible to all methods
require 'csv'  # use the CSV library

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    load_selection(STDIN.gets.chomp)
  end
end

def load_selection(selection)
    numbers = {"1" => method(:input_students),
               "2" => method(:show_students),
               "3" => method(:save_students),
               "4" => method(:load_students),
               "9" => method(:exit)}
    numbers[selection].()
end

def push_to_array(name)
  @students << {:name => name, :cohort => :november}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
    name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
      while !name.empty? do
  # add the student hash to the array
      push_to_array(name)
      puts "Now we have #{@students.count} students"
  # get another name from the user
      name = STDIN.gets.chomp
    end
  # return the array of students
  @students
end

def load_students
  puts "Which file do you want to load?"
  load_file = STDIN.gets.chomp
   if load_file.nil?
     puts "You didn't put anything in"
   elsif not File.exist?(load_file) # if it exists
     puts "No such file – #{load_file} doesn't exist"
   else
     CSV.foreach(load_file) do |row|
       push_to_array(row[0])
      end
      puts "Students successfully loaded from '#{load_file}'"
    end
end

def show_students
  puts "Showing students now..."
  print_header
  print_students_list
  print_footer
end

## Printing the list of students:
def print_header
  puts
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "-------------"
  puts "Overall, we have #{@students.count} great students"
  puts
end
## ---------------------------

def save_students
  puts "Name your new file"
  new_file = STDIN.gets.chomp
  return if new_file.nil?
  # open file for writing
  if File.exist?(new_file) # if it exists
    CSV.open(new_file, "a+") do |file|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file << csv_line
    end
  else
    CSV.open(new_file, "wb") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file << csv_line
      end
    end
  end
  puts "Students successfully saved to '#{new_file}'"
end

load_students
interactive_menu
