class SearchAnalyticsController < ApplicationController
  def index
    @search_analytics = SearchAnalytic.all.order(search_count: :desc)
  end

  def delete_all_search_analytics
    SearchAnalytic.destroy_all

    flash[:notice] = "All statistics destroyed"

    redirect_to action: :index
  end
end
