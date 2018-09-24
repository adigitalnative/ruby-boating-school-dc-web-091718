require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

spongebob= Student.new("Spongebob")
patrick= Student.new("Patrick")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

test1= spongebob.add_boating_test("Don't Crash 101", "pending", puff)


# ///////////////////////////////////////////////////////

puts "Student' class:"
puts "should initialize with first_name"
puts spongebob.first_name == "Spongebob"

puts "Student.all should return all of the student instances"
puts Student.all.include?(spongebob)
puts Student.all.include?(patrick)

puts "Student#add_boating_test should initialize a new boating test with a student (Object), a boating test name (String), a boating test status (String), and an Instructor (Object)"
test2 = patrick.add_boating_test("new test", "pending", krabs)
puts BoatingTest.all.include?(test2)

puts "Student.find_student will take in a student first name and output that student"
puts Student.find_student("Spongebob") == spongebob

puts "'BoatingTest' class:"
puts "  should initialize with student (Object), a boating test name (String), a boating test status (String), and an Instructor (Object)"
test3 = BoatingTest.new(patrick, "Another test", "pending", krabs)
puts BoatingTest.all.include?(test3)
puts "BoatingTest.all returns an array of all boating tests"
puts BoatingTest.all.include?(test1 && test2 && test3)

puts "'Instructor' class:"

puts "init with name"
new_instr = Instructor.new("Jane")
puts Instructor.all.include?(new_instr)
puts "return all instructors"
puts Instructor.all.include?(puff && krabs && new_instr)

puts "Instructor.pass_student should take in a student name and test name and return status (passed)"
puts Instructor.pass_student(spongebob, test1) == "passed"
puts "Instructor.fail_student should take in a student name and test name and return status failed"
puts Instructor.fail_student(patrick, test2) == "failed"
puts "Instructor.student_grade_percentage should take in a student first name and output the percentage of tests that they have passed"
new_student = Student.new("Joe")
test_one = BoatingTest.new(new_student, "Boating Test One", "passed", krabs)
test_two = BoatingTest.new(new_student, "Boating Test One", "passed", krabs)
test_three = BoatingTest.new(new_student, "Boating Test One", "passed", krabs)
test_four = BoatingTest.new(new_student, "Boating Test One", "failed", krabs)
puts Instructor.student_grade_percentage("Joe") == 75


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# binding.pry
0 #leave this here to ensure binding.pry isn't the last line

