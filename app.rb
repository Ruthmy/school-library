#!/usr/bin/env ruby

require_relative 'person'
require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

# App class - Main class to manage the app
class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    main_menu
    option = gets.chomp.to_i

    case option
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals_per_person
    else
      puts "\nThanks for using School Library App!\nGood bye!"
      sleep 3
      exit
    end
  end

  private

  # Main menu for the app
  def main_menu
    puts "\n\nWhat you need to do now?\n\n"
    puts 'Please, select one of the options below:'
    puts '1. List all books.'
    puts '2. List all people.'
    puts '3. Create a person.'
    puts '4. Create a book.'
    puts '5. Create a rental.'
    puts '6. List all rentals for a given person id.'
    puts "[Other keys]. Exit \n\nEnter your option: "
  end

  # Logic to list all books
  def list_books
    puts "\n\nListing all books:\n\n"
    if @books.empty?
      puts 'There are no books yet.'
      sleep 3
      run
    end

    @books.each do |book|
      puts "Book: #{book.title}, Author: #{book.author}"
    end
    sleep 3
    run
  end

  def list_people
    if @people.empty?
      puts 'There are no people yet.'
      sleep 3
      run
    end
    puts "\n\nListing all people:\n\n"
    @people.each do |person|
      puts "ID: #{person.id} - Name: #{person.name}, Age: #{person.age}"
    end
    sleep 3
    run
  end

  # Logic to create a student
  def create_student
    puts "\n\nCreating a student, please enter the student's information:"
    puts 'Classroom'
    clas = gets.chomp.strip
    puts 'Name:'
    name = gets.chomp.strip
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Has parent permission? (y/n):'
    per = gets.chomp.strip
    per = per == 'y'

    classroom = Classroom.new(clas)
    student = Student.new(classroom, age, name, parent_permision: per)
    @people.push(student)
    puts "\nStudent created with ID: #{student.id}"
    sleep 3
    run
  end

  def create_teacher
    puts "\n\nCreating a teacher, please enter the teacher information:"
    puts 'Name:'
    name = gets.chomp.strip
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Specialization:'
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts "\nTeacher created with ID: #{teacher.id}"
    sleep 3
    run
  end

  def create_person
    puts "\n\nDo you want to create a student or a teacher?\n\nPlease, enter the number of your choice:"
    puts '1. Student'
    puts '2. Teacher'
    puts "Go back to main menu: 0 \n\nEnter your option:"

    option = gets.chomp.to_i

    case option
    when 1
      create_student
    when 2
      create_teacher
    when 0
      run
    else
      puts "Invalid option, please try again.\n\n"
      sleep 2
      create_person
    end
  end

  def create_book
    puts "\n\nCreating a book, please enter the book information:"
    puts 'Name:'
    name = gets.chomp
    puts 'Author:'
    author = gets.chomp

    book = Book.new(name, author)
    @books.push(book)
    puts "\nBook created successfully:\n#{name} - #{author}\n"
    sleep 3
    run
  end

  def select_book_from_list
    if @books.empty?
      puts 'There are no books yet.'
      sleep 3
      run
    end
    puts "\n\nListing all books:\n\nPlease enter the ID of the book:"
    @books.each_with_index do |book, index|
      puts "#{index}). #{book.title} - #{book.author}"
    end
    puts "\n\nEnter your option:"
    option = gets.chomp.to_i
    @books[option]
  end

  def select_person_from_list
    if @people.empty?
      puts 'There are no people yet.'
      sleep 3
      run
    end
    puts "\n\nListing all people:\n\nPlease enter the number of the person: (not ID)"
    @people.each_with_index do |person, index|
      puts "#{index}). #{person.id} - Nombre: #{person.name}, Edad: #{person.age}"
    end
    puts "\n\nEnter your option:"
    option = gets.chomp.to_i
    @people[option]
  end

  def create_rental
    puts "\n\nCreating a rental, please enter the following information:"

    puts 'Date:'
    date = gets.chomp.strip

    book = select_book_from_list
    person = select_person_from_list

    if book.nil? || person.nil?
      puts "\nBook or person not found, please try again.\n\n"
      sleep 3
      create_rental
    else
      rental = Rental.new(date, book, person)
      @rentals.push(rental)
      puts "\nRental created successfully"
      sleep 3
      run
    end
  end

  def select_person_by_id
    puts "\n\nPlease enter the ID of the person:"
    id = gets.chomp.to_i
    person = @people.find { |p| p.id == id }
  end

  def list_rentals_per_person
    id = select_person_by_id.id
    rentals = @rentals.select { |rental| rental.person.id == id }
    puts "\n\nListing rentals for person with ID #{id}:\n\n"
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}"
    end
    sleep 3
    run
  end

end
