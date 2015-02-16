require 'menu'

describe 'Menu' do

  let(:menu) {Menu.new}

  let(:fish) {double :dish, name: 'Fish', price: 7.50}
  let(:burger) {double :dish, name: 'Burger', price: 6.25}
  let(:steak) {double :dish, name: 'Steak', price: 11.50}

  def populate_menu
    menu.add_dish(fish)
    menu.add_dish(burger)
    menu.add_dish(steak)
  end


  it 'can have a dish added to its list' do
    dish = double :dish
    menu.add_dish(dish)
    expect(menu.get_dishes).to eq [dish]
  end


  it 'Returns a formatted string of each Dish' do

    populate_menu

    # Output should be:
    #
    # Fish    --   7.50
    # Burger  --   6.25
    # Steak   --  11.50
    expect(menu.get_menu).to eq "Fish    --   7.50\nBurger  --   6.25\nSteak   --  11.50\n"
  end


end