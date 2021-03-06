## What happens if the user doesn't enter any
## students? It will try to print an empty list.
## How can you use an if statement (Control Flow)
## to only print the list if there is at least one
## student in there?

@students = [] # an empty array accessible to all methods

def save_students
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else "I don't know what you meant"
  end
end

def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
    name = gets.chomp
  # while the name is not empty, repeat this code
      while !name.empty? do
  # add the student hash to the array
      @students << {:name => name, :cohort => :november}
      puts "Now we have #{@students.count} students"
  # get another name from the user
      name = gets.chomp
    end
  # return the array of students
  @students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list(students)
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

interactive_menu
