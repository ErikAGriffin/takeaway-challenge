require 'takeaway'

describe 'Takeaway' do

  let(:takeaway) {Takeaway.new}

  it 'takes a dish order, either incrementing its quantity by 1 or setting to the amount specified' do

    fish = double :dish, quantity: 2
    steak = double :dish, quantity: 1
    takeaway.add_dish(fish)
    takeaway.add_dish(steak)

    order_amount = 2

    expect(fish).to receive(:set_quantity).with(order_amount)
    expect(steak).to receive(:add)

    takeaway.order(fish,2)
    takeaway.order(steak)

    expect(fish.quantity).to eq 2
    expect(steak.quantity).to eq 1
  end

  it 'Calculates the total price correctly' do

    populate_menu

    # Fish    --   7.50
    # Burger  --   6.25
    # Steak   --  11.50

    # Ordering 3 burgers and 1 steak
    # Expected total is 30.25

    expect(takeaway.calculate_price).to eq 30.25

  end

  it "Formats a string 'Thank you! Your order was placed and will be delivered before.. when the order is processed" do

    # !! ** !!
    # Why does this pass even if I comment out the returning string?

    # Fish    --   7.50
    # Burger  --   6.25
    # Steak   --  11.50

    # Ordering 3 burgers and 1 steak
    # Expected total is 30.25
    populate_menu
    time = Time.new
    expect(takeaway).to receive(:order_success).and_return("Thank you! Your order was placed and will be delivered before #{(time.hour+1)%24}:#{time.min}")

    takeaway.place_order

  end





end
