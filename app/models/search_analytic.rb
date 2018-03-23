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

class SearchAnalytic < ApplicationRecord
end
