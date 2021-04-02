module TasksHelper

  def remaining_time(date)
    return 'Today' if Date.current == date

    time_ago_in_words date
  end
end
