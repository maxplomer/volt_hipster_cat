class Game < Volt::Model
  def play(page)
    #self._name += 'PLAYED'
    page._playing_a_game = true
  end
end