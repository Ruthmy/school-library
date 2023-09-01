require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permision: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permision = parent_permision
    puts 'Created'
  end

  def can_use_services?
    of_age? || @parent_permision
  end

  def correct_name
    @name
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
