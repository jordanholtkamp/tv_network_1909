require 'pry'
class Show

  attr_reader :name, :creator, :characters
  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    salary = characters.map do |character|
      character.salary
    end
    salary.reduce(0) { |sum, salary| sum + salary }
  end
end