class Menu < Array

  def add_dish(dish)
    self << dish
  end

  def get_menu
    menu = ""
    each do |dish|
      menu = menu + menu_list_item(dish)
    end
    menu
  end


  # # # # #

  private

  def longest_dish_name
    inject {|max, word| max.name.length > word.name.length ? max : word}.name.length
  end

  def longest_dish_price
    get_price(inject {|max, price| (get_price(max)).length > (get_price(price)).length ? max : price}).length
  end

  def get_price(dish)
    '%.2f' % dish.price
  end

  def menu_list_item(dish)
    price = get_price(dish)
    pre_space = "".center(longest_dish_name-dish.name.length)
    separator = "  --  "
    post_space = "".center(longest_dish_price-price.length)
    "#{dish.name}"+pre_space+separator+post_space+"#{price}\n"
  end


end
