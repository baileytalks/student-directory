## Research how the method center() of the String class
## works. Use it in your code to make the output beautifully
## aligned.

# asking for input
def input_students
  puts "Please enter the student details"
  puts "To finish, just type 'done'"

  students = []

  loop do
  puts "To start, type in their name"
  name = gets.chomp
  if name == "done"
    break
  end

  puts "What is their hobby?"
  hobby = gets.chomp
  if hobby == "done"
    break
  end

  puts "What's their country of birth?"
  country_of_birth = gets.chomp
  if country_of_birth == "done"
    break
  end

  puts "What's their height?"
  height = gets.chomp
  if height == "done"
    break
  end

  puts "What's their favourite biscuit?"
  biscuit = gets.chomp
  if biscuit == "done"
    break
  end

    students << {name: name,
                hobby: hobby,
                country_of_birth: country_of_birth,
                height: height,
                biscuit: biscuit,
                cohort: :november}
    puts "Now we have #{students.count} students"
  end
  # return the array of students
  students
end

def print_header
  puts
  puts "The students of Villains Academy"
  puts "------------"
end

## Print only the names which are shorter than 12 characters
def print(students)
  students.each do |student|
      puts "#{student[:name]}:
            likes #{student[:hobby]},
            is from #{student[:country_of_birth]},
            is #{student[:height]}
            and likes #{student[:biscuit]}s
            (#{student[:cohort]} cohort)"
      puts
  end
end

def print_footer(students)
  puts "------------"
  puts "Overall, we have #{students.count} great students"
  puts
end

students = input_students
# nothing will happen until we call the methods
print_header
print(students)
print_footer(students)

students.group_by { |hash| hash[:biscuit] }.each { |key, value|
  puts "#{key.capitalize}"
  puts "---------------"
  value.each {|v|
    puts v[:name]
    }
  }
