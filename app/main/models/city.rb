class City < Volt::Model
  has_many :cats
  #has_many :apartments
  has_many :jobs

  def self.create_default_cities(store, game_id)
    ["suburbs", "brooklyn", "LA"].map do |city_name|
      new_city = self.new(name: city_name, game_id: game_id)
      store._cities << new_city
      Cat.create_cats(store, new_city.id)
      Job.create_jobs(store, new_city.id, city_name)
      #Apartment.create_apartments(store, new_city.id)
    end
  end

end