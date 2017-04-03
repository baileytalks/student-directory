
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    push_to_array(name)
  end
  file.close
  puts "Students successfully loaded from '#{filename}'"
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
  # open file for writing
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students successfully saved to 'students.csv'"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students('students.csv')
    puts "Loaded #{@students.count} from 'students.csv'"
  elsif File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else not File.exist?(filename)
    puts "Sorry, #{filename} does not exist"
    load_students('students.csv')
    puts "Loaded #{@students.count} from 'students.csv'"
  end
end

try_load_students
interactive_menu
