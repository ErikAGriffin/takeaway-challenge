require 'takeaway'

describe 'Takeaway' do

  let(:takeaway) {Takeaway.new(menu)}
  let(:order) {double :order}
  let(:menu) {[fish,burger,steak]}
  let(:fish) {double :dish, name: 'Fish', price: 7.50}
  let(:burger) {double :dish, name: 'Burger', price: 6.25}
  let(:steak) {double :dish, name: 'Steak', price: 11.50}

  it 'Calculates the total price correctly' do

    # Fish    --   7.50
    # Burger  --   6.25
    # Steak   --  11.50
    # –––––––––––––––––
    # Ordering 3 burgers and 1 steak
    # Expected total is 30.25

    allow(order).to receive(:get_total).with(burger).and_return(3)
    allow(order).to receive(:get_total).with(steak).and_return(1)
    allow(order).to receive(:get_total).with(fish).and_return(0)

    expect(takeaway.calculate_price(order)).to eq 30.25

  end

    # !! ** !!
    # Why does this pass even if I comment out the returning string?

  it "Formats a string 'Thank you! Your order was placed and will be delivered before.. when the order is processed" do

    time = Time.new
    expect(takeaway).to receive(:order_success).and_return("Thank you! Your order was placed and will be delivered before #{(time.hour+1)%24}:#{time.min}")
    takeaway.place_order

  end





end
