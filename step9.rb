## What happens if the user doesn't enter any
## students? It will try to print an empty list.
## How can you use an if statement (Control Flow)
## to only print the list if there is at least one
## student in there?

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will terminate the program
    else
      puts "I don't know what you meant, try again"
    end
  # 3. do what the user has asked
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
    students = []
  # get the first name
    name = gets.chomp
  # while the name is not empty, repeat this code
      while !name.empty? do
  # add the student hash to the array
      students << {:name => name, :cohort => :november}
      puts "Now we have #{students.count} students"
  # get another name from the user
      name = gets.chomp
    end
  # return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

interactive_menu
