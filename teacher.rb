require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permision: true)
    super(age, name, parent_permision: parent_permision)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
