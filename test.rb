# test and run the whole code

# From the 2nd milestone: decorate a class
require_relative 'person'

puts 'From the 2nd milestone: decorate a class'
person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

# From the third milestone: associations

require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

puts 'From the third milestone: associations'

student = Student.new(1, 17, 'John Doe')
classroom = Classroom.new('A')
book = Book.new('Math', 'John Doe')
rental = Rental.new('12-12-2018', book, student)
teacher = Teacher.new('Math', 34, 'Jane Doe')

puts student
puts classroom
puts book
puts rental
puts teacher
