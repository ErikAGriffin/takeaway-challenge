class Dish

  attr_reader :name, :price

  def initialize(name = 'Empty', price = 0.0)
    @name = name
    @price = price
  end


end
