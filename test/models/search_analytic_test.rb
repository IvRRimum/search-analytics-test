# == Schema Information
#
# Table name: search_analytics
#
#  id           :integer          not null, primary key
#  search_term  :string
#  search_count :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SearchAnalyticTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
