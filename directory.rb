
# Here's the list of students in an array:
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffery Baratheon",
  "Norman Bates",
]

# Now we print them:
puts "The students of Villains Academy"
puts "------------"
students.each do |student|
  puts students
end

# Finally, we print the total:
puts
puts "Overall, we have #{students.count} great students"
