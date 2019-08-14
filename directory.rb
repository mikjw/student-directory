def input_students
  puts "Enter names, or press return twice to finish"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
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
  index = 0
  while index < students.length
    if students[index][:name][0].downcase == 'p' && students[index][:name].length <= 12
      puts "#{index + 1}: #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    end
    index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
