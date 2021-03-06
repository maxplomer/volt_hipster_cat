class Game < Volt::Model
  has_many :cities
  has_many :cats

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
    page._adopting_a_cat = false
  end

  def game_over?
    false
  end

  def current_city
    self.cities.where(name: self._location).first
  end

  def adopt_a_cat(page)
    page._prompt_user_for_input = false
    page._adopting_a_cat = true
  end

  def adopt_this_cat(cat, page)
    page._taking_cat_adoption_test = true
    page._chosen_cat = cat
  end

  def submit_cat_test(cat, cat_sum, page)
    if cat_sum.to_i == cat.get_sum
      _cats << { name: cat._name, game_id: self.id }
      cat.destroy
      page._taking_cat_adoption_test = false
      page._adopting_a_cat = false
      page._prompt_user_for_input = true
    else
      page._failed_cat_test = true
    end

    page._cat_sum = ''
  end

  def click_ok_failed_cat_test(page)
    page._failed_cat_test = false
    page._taking_cat_adoption_test = false
    page._adopting_a_cat = false
    page._prompt_user_for_input = true
  end

  # def game_over
  # end

  def print_time
    x = self._current_time
    "#{x.month}/#{x.day}/#{x.year}"
  end

end