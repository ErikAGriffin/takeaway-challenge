class Customer

  attr_reader :order

  def initialize
    @order = {}
  end

  def add(dish)
    key = dish.name.to_sym
    if order.has_key?(key)
      order[key] += 1
    else
      order.store(key,1)
    end
  end

  def set_quantity(dish,number)
    key = dish.name.to_sym
    number < 0 ? number = 0 : number
    order.has_key? key ? order[key] = number : order.store(key,number)
  end





end