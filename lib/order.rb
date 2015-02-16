class Order < Hash


  def add(dish)
    key = dish.name.to_sym
    if has_key? key
      self[key] += 1
    else
      store(key,1)
    end
  end

  def set_quantity(dish,number)
    key = dish.name.to_sym
    number < 0 ? number = 0 : number
    has_key? key ? self[key] = number : store(key,number)
  end

  def get_total
    inject(0) do |total, dish|
      key = dish.name.to_sym
      dish_total = dish.price * self[key]
      total = total + dish_total
    end
  end


end
