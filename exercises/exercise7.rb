## In the input_students method the cohort value
## is hard-coded. How can you ask for both the name
## and the cohort? What if one of the values is empty?
## Can you supply a default value? The input will be
## given to you as a string? How will you convert it
## to a symbol? What if the user makes a typo?

# asking for input

@months = ['january', 'february', 'march',
          'april', 'may', 'june', 'july',
          'august', 'september', 'october',
          'november', 'december']

def input_students
  puts "Please enter the student details"
  puts "To finish, just type 'done'"

  students = []

  loop do
    begin
    puts "To start, type in their name"
      name = gets.chomp
    end until name != ""
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

  puts "What's their cohort?"
  answer = gets.chomp.to_sym
  if
    @months.include?(answer.to_s) == true
    cohort = answer
  elsif
    cohort == "done"
    break
  else
    cohort = :april
    puts "There's no #{answer} cohort, so we've assigned this student to April"
  end

  puts "We've assigned this student to #{cohort.capitalize}, is that OK?"
  puts "Type y or n"
  ok = gets.chomp
    if ok == "n"
      puts "What's their cohort?"
      answer = gets.chomp.to_sym
      if
        @months.include?(answer.downcase.to_s) == true
        cohort = answer
      elsif
        cohort == "done"
        break
      end
    elsif
      ok != 'y'
      puts "That's neither 'y' or 'n', dummy!"
    end

    students << {name: name,
                hobby: hobby,
                country_of_birth: country_of_birth,
                height: height,
                biscuit: biscuit,
                cohort: cohort}
    puts "Now we have #{students.count} students"
  # return the array of students
end
  students
end

def print_header
  puts
  puts "The students of Villains Academy".center(50, '--')
  puts "------------".center(50, '--')
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
  puts "------------".center(50, '--')
  puts "Overall, we have #{students.count} great students"
  puts
end

students = input_students
# nothing will happen until we call the methods
print_header
print(students)
print_footer(students)
