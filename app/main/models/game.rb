class Game < Volt::Model
  def play(page)
    page._playing_a_game = true
    page._game = self
    play_round(page)
    #play_round(page) until game_over?
    #game_over

    nil
  end

  def play_round(page)
    #page._current_time = self.current_time
    page._prompt_user_for_input = true
  end


  def game_over?
    false
  end

  # def game_over
  # end

  def print_time
    x = self._current_time
    "#{x.month}/#{x.day}/#{x.year}"
  end

end