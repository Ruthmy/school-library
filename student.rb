require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name: 'Unknown', parent_permision: true)
    super(age, name, parent_permision)
    @classroom = classroom
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end
end
