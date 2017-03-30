## Modify your program to only print the students
## whose name begins with a specific letter

# asking for input
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  ## create an empty array
  students = []
  ## get the first name
  name = gets.chomp
  ## while the name is not empty, repeat this code
  while !name.empty? do
    ## add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    ## get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

## Print only the names beginning with the letter your user has specified
def print(students)
  puts "Which letter should we be looking for?"
  letter = gets.chomp.downcase

  students.each do |student|
      if letter == student[:name][0].to_s.downcase
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing will happen until we call the methods
print(students)
