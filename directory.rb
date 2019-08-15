def input_students
  puts "Enter names, or press return twice to finish"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november, year_of_birth: 1960, country_of_birth: "USA"}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort) born: #{student[:year_of_birth]} in #{student[:country_of_birth]}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
