class City < Volt::Model

  def self.create_default_cities(store, game_id)
    ["suburbs", "brooklyn", "LA"].map do |city_name|
      store._cities << self.new(name: city_name, game_id: game_id)
    end
  end

end