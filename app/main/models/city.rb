class City < Volt::Model

  def self.create_default_cities(game_id)
    ["suburbs", "brooklyn", "LA"]
  end

end