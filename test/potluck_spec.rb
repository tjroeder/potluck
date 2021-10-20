require './lib/dish'
require './lib/potluck'


RSpec.describe Potluck do
  before(:each) do
    @potluck = Potluck.new('7-13-18')
    @couscous_salad = Dish.new('Couscous Salad', :appetizer)
    @cocktail_meatballs = Dish.new('Cocktail Meatballs', :entree)
    @summer_pizza = Dish.new('Summer Pizza', :appetizer)
    @roast_pork = Dish.new('Roast Pork', :entree)
    @candy_salad = Dish.new('Candy Salad', :dessert)
    @bean_dip = Dish.new('Bean Dip', :appetizer)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@potluck).to be_instance_of(Potluck)
    end

    it 'has a date' do
      expect(@potluck.date).to eq('7-13-18')
    end

    it 'has empty array of dishes' do
      expect(@potluck.dishes).to eq([])
    end
  end

  describe '#add_dish' do
    it 'can add dishes' do
      @potluck.add_dish(@couscous_salad)
      expect(@potluck.dishes).to eq([@couscous_salad])
      @potluck.add_dish(@cocktail_meatballs)
      expect(@potluck.dishes).to eq([@couscous_salad, @cocktail_meatballs])
      expect(@potluck.dishes.length).to eq(2)
    end
  end

  describe '#get_all_from_category' do
    it 'can return all items from a specified category' do
      @potluck.add_dish(@couscous_salad)
      @potluck.add_dish(@summer_pizza)
      @potluck.add_dish(@roast_pork)
      @potluck.add_dish(@cocktail_meatballs)
      @potluck.add_dish(@candy_salad)

      expect(@potluck.get_all_from_category(:appetizer)).to eq([@couscous_salad, @summer_pizza])

      expect(@potluck.get_all_from_category(:appetizer).first).to eq(@couscous_salad)
      expect(@potluck.get_all_from_category(:appetizer).first.name).to eq('Couscous Salad')
    end
  end

  describe '#menu' do
    it 'returns the menu items sorted alphabetically by category' do
      @potluck.add_dish(@couscous_salad)
      @potluck.add_dish(@summer_pizza)
      @potluck.add_dish(@roast_pork)
      @potluck.add_dish(@cocktail_meatballs)
      @potluck.add_dish(@candy_salad)
      @potluck.add_dish(@bean_dip)

      expect(@potluck.menu).to eq({:appetizers=>['Bean Dip', 'Couscous Salad', 'Summer Pizza'],:entrees=>['Cocktail Meatballs', 'Roast Pork'],:desserts=>['Candy Salad']})
    end
  end

  describe '#ratio' do
    it 'returns ratio of a selected category to all dishes' do
      @potluck.add_dish(@couscous_salad)
      @potluck.add_dish(@summer_pizza)
      @potluck.add_dish(@roast_pork)
      @potluck.add_dish(@cocktail_meatballs)
      @potluck.add_dish(@candy_salad)
      @potluck.add_dish(@bean_dip)
      expect(@potluck.ratio(:appetizer)).to eq(50.0)
    end
  end

end