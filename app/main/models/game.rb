class Game < Volt::Model
  def play
    self._name += 'PLAYED'
  end
end