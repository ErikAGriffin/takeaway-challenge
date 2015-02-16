require 'dish'

describe 'Dish' do

  let(:dish) {Dish.new('Tasty Tofu',1.50)}

  it 'has a name' do
    expect(dish.name).to eq 'Tasty Tofu'
  end

  it 'has a price' do
    expect(dish.price).to eq 1.50
  end


end
