require 'customer'


describe 'Customer' do



  let(:dish) {double :dish, name: "Tofu"}
  let(:customer) {Customer.new}

  it 'has an order' do
    expect(customer.order).to_not eq nil
  end

  it 'can add a dish to his/her order' do
    customer.add(dish)
    expect(customer.order).to eq({"#{dish.name}": 1})
  end

  it 'can add 2 of a dish to his/her order' do
    customer.add(dish)
    customer.add(dish)
    expect(customer.order).to eq({"#{dish.name}": 2})
  end

  it 'can set the quantity of a particular dish in their order' do
    customer.set_quantity(dish,4)
    expect(customer.order).to eq({"#{dish.name}": 4})
  end

  it 'will set a quantity to zero if any negative values are entered' do
    customer.add(dish)
    customer.set_quantity(dish,-20)
    expect(customer.order).to eq({"#{dish.name}": 0})
  end



end