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

  def set_quantity(dish,quant)
    key = dish.name.to_sym
    quant < 0 ? quant = 0 : quant
    order.has_key? key ? order[key] = quant : order.store(key,quant)
  end





end