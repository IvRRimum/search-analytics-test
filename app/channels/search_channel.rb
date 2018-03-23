class SearchChannel < ApplicationCable::Channel
  def subscribed
    @all_search_terms = []
  end

  def register_search_term data
    search_term = data["search_term"] || ""

    if check_if_still_in_the_same_search search_term
      @all_search_terms << search_term
    else
      save_analytics_for_search_term
    end
  end

  def save_analytics_for_search_term
    SearchAnalytic.create({search_term: @all_search_terms.last, search_count: @all_search_terms.count})
  end

  private

  def check_if_still_in_the_same_search search_term
    last_search_term = @all_search_terms.last

    unless last_search_term.nil?
      if search_term == ""
        # it is a new search term
        return false
      else
        return true
      end
    end

    true
  end
end
