require 'takeaway'

describe 'Takeaway' do

  let(:takeaway) {Takeaway.new}

  it 'Calculates the total price correctly' do

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

    time = Time.new
    expect(takeaway).to receive(:order_success).and_return("Thank you! Your order was placed and will be delivered before #{(time.hour+1)%24}:#{time.min}")

    takeaway.place_order

  end





end
