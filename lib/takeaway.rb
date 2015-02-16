require_relative 'texter'
class Takeaway

  include Texter

  attr_reader :dishlist

  def initialize(menu = "no menu")
    @menu = menu
    @order_total = 0
    @texter = new_text_client
  end

  def calculate_price(order)
    @order_total = @menu.inject(0) do |sum, dish|
      dish_total = dish.price * order.get_total(dish)
      sum = sum + dish_total
    end
  end

  def place_order(order)
      calculate_price(order)
      msg = order_success
    # !! ** !!
      @texter.account.messages.create({to: "+447759862868",from: "+441183240530",body: msg})
  end


  # # # # # # # # # #

  private

  def order_success
    time = Time.new
    "Total: $#{@order_total}\nThank you! Your order was placed and will be delivered before #{(time.hour+1)%24}:#{time.min}"
  end



end
