class Network

  attr_reader :name, :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def highest_paid_actor
    salaries = @shows.map do |show|
      show.characters.map do |character|
        character.salary
      end
    end
    top_sal = salaries.flatten.sort.last
    char = @shows.map do |show|
      show.characters.find do |character|
        character.salary == top_sal
      end
    end
    char.last.actor
  end
  # I am aware that this is probably not the best way to do this and i probably over complicated it :)

  def payroll
    char_array = @shows.map do |show|
      show.characters
    end

    flat = char_array.flatten
    flat.reduce({}) do |sal_hash, char|
      sal_hash[char.actor] = char.salary
      sal_hash
    end
  end
end