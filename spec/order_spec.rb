require 'order'

describe 'Order' do

  let(:order) {Order.new}
  let(:dish) {double :dish, name: "Tofu"}

  it 'can add a dish' do
    order.add(dish)
    expect(order).to eq({Tofu: 1})
  end

  it 'can add 2 of any dish' do
    order.add(dish)
    order.add(dish)
    expect(order).to eq({Tofu: 2})
  end

  it 'can set order amount of any particular dish' do
    order.set_quantity(dish,4)
    expect(order).to eq({Tofu: 4})
  end

  it 'will set a quantity to zero if any negative values are entered' do
    order.add(dish)
    order.set_quantity(dish,-20)
    expect(order).to eq({Tofu: 0})
  end

  it 'Calculates the total price correctly' do
    # Fish    --   7.50
    # Burger  --   6.25
    # Steak   --  11.50
    # –––––––––––––––––
    # Ordering 3 burgers and 1 steak
    # Expected total is 30.25

    fish = double :dish, name: "Fish", price: 7.50
    burger = double :dish, name: "Cheeseburger", price: 6.25
    steak = double :dish, name: "Rib Eye", price: 11.50
    order.set_quantity(burger,3)
    order.add(steak)

    expect(order.get_total).to eq 30.25

  end

end