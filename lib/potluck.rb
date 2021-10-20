class Potluck
  attr_accessor :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(select_category)
    @dishes.find_all { |dish| dish.category == select_category }
  end

  def menu
    @dishes.sort_by(&:name).group_by(&:category).transform_keys! { |category| (category.to_s + 's').to_sym }.transform_values! { |dish| dish.map(&:name) }
  end

  def ratio(sel_category)
    get_all_from_category(sel_category).count.to_f / @dishes.count.to_f * 100.0
  end
end