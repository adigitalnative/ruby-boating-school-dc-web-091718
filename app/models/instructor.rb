class Instructor

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  # Instructor.pass_student should take in a student name and test name and return status passed(?)
  # ? Why is this passing in a student? Tests already belong to a student so if I have the test I have the student...
  def self.pass_student(student, test)
    if test.student == student
      test.status = "passed"
      return "passed"
    else
      "Mismatch, check again"
    end
  end

  # Instructor.fail_student should take in a student name and test name and return status failed
  def self.fail_student(student, test)
    if test.student == student
      test.status = "failed"
      return "failed"
    else
      "Mismatch, check again"
    end
  end

  # Instructor.student_grade_percentage should take in a student first name and output the percentage of tests that they have passed
  def self.student_grade_percentage(name)
    student = Student.find_student(name)
    tests = BoatingTest.all.select { |test| test.student == student }
    passed_tests = tests.select { |test| test.status == "passed" }

    (passed_tests.count.to_f / tests.count.to_f * 100).to_i
  end
end
