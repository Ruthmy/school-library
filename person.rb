require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rental

  def initialize(age, name = 'Unknown', parent_permision: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permision = parent_permision
    puts 'Created'
    @rental = []
  end

  def can_use_services?
    of_age? || @parent_permision
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    @rental << Rental.new(date, book, self)
  end

  private

  def of_age?
    true if age >= 18
  end
end

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.slice(0, 10)
  end
end
