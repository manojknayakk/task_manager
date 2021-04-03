module TasksHelper

  def remaining_time(date)
    return 'Today' if Date.current == date

    word = time_ago_in_words date
    word += ' ago' if Date.current > date
    word
  end
end
