class City < Volt::Model
  has_many :cats
  #has_many :apartments
  #has_many :jobs

  def self.create_default_cities(store, game_id)
    ["suburbs", "brooklyn", "LA"].map do |city_name|
      new_city = self.new(name: city_name, game_id: game_id)
      store._cities << new_city
      #self.create_cats(store, new_city.id)
      #create_jobs(store, new_city.id)
      #create_apartments(store, new_city.id)
    end
  end

  def self.create_cats(store, city_id)
    rand(10).times do 
      new_cat = Cat.create_my_cat
      new_cat.city_id = city_id
      store._cats << new_cat
    end
  end



end