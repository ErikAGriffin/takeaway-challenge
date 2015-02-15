require 'twilio-ruby'
class Takeaway

  attr_reader :dishlist

  def initialize(dishes = [])
    @dishlist = dishes

    # -- Twilio Login
    account_sid = "ACaec4d28c46b3cad3b94eb351ea3231d5"
    auth_token = "04c7f3d58a93daca72f3b40bb132f310"

    @texter = Twilio::REST::Client.new account_sid, auth_token
  end


  def add_dish(dish)
    @dishlist << dish
  end

  def menu
    menu = ""
    @dishlist.each do |dish|
      menu = menu + menu_list_item(dish)
    end
    menu
  end

  def order(dish,quantity="ADD")
    if quantity == "ADD"
      dish.add
    else
      dish.set_quantity(quantity)
    end
  end

  def calculate_price
    @dishlist.inject(0) do |sum, dish|
      dish_total = dish.price * dish.quantity
      sum = sum + dish_total
    end
  end

  def place_order(expected_price)
    if calculate_price != expected_price
      raise 'That price is unexpected'
    else
      msg = order_success
      @texter.account.messages.create({to: "+447759862868",from: "+441183240530",body: msg})
    end
  end


  # # # # # # # # # #

  private

  def longest_dish_name
    @dishlist.inject {|max, word| max.name.length > word.name.length ? max : word}.name.length
  end

  def longest_dish_price
    get_price(@dishlist.inject {|max, price| (get_price(max)).length > (get_price(price)).length ? max : price}).length
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

  def order_success
    time = Time.new
    "Thank you! Your order was placed and will be delivered before #{(time.hour+1)%24}:#{time.min}"
  end



end
