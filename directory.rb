def input_students(default_cohort)
  students = []
  while true
    puts "Enter name and press return. Leave blank to finish."
      name = gets.chomp
      if name == ""
        break
      end 
    while true
      puts "Enter cohort. Leave blank to use default cohort."
      cohort = gets.chomp
      if cohort == ""
        cohort = default_cohort.to_s
        students << {name: name, cohort: cohort.to_s} 
        break 
      elsif !check(cohort) 
        puts "Error - please enter a valid cohort" 
      elsif check(cohort) 
        students << {name: name, cohort: cohort.to_s} 
        break
      end 
    end
    puts "Now we have #{students.count} #{pluralise?(students)}"
  end
  students
end 

def check(cohort)
  valid_cohorts = ['january', 'feburary', 'march', 'april',
  'may', 'june', 'august', 'september', 'october', 'november', 'december']
  valid_cohorts.include?(cohort.downcase)
end 

def print_header(students)
  puts "The #{pluralise?(students)} of Villains Academy".center(60)
  puts "-------------".center(60)
end

def print(students)
  current_cohorts = []
  students.each_with_index do |student|
    if !current_cohorts.include?(student[:cohort])
      current_cohorts << student[:cohort]
    end 
  end 
  current_cohorts.each do |cohort|
    puts "#{pluralise?(students)} in #{cohort} cohort:".center(60)
    students.each_with_index do |student, index|
      if student[:cohort] == cohort
        puts "#{index + 1}: #{student[:name]}".center(60)
      end
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{pluralise?(students)}".center(60)
end

def pluralise?(students)
  if students.count == 1
    "student"
  else
    "students"
  end 
end 

students = input_students("may")
print_header(students)
print(students)
print_footer(students)
