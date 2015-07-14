class Cat < Volt::Model

  # NAMES = [
  #   'Afro',
  #   'Archibald',
  #   'Babe',
  #   'Bacon',
  #   'Banjo',
  #   'Barney',
  #   'Big Guy',
  #   'Big Red'
  # ]

  # def Cat.create_my_cat
  #   self.new(name: NAMES.sample)
  # end

  def self.create_cats(store, city_id)
    store._cats << {name: 'sam', city_id: city_id}
  end

end