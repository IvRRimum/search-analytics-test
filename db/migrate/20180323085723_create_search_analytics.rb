class CreateSearchAnalytics < ActiveRecord::Migration[5.1]
  def change
    create_table :search_analytics do |t|
      t.string :search_term
      t.integer :search_count

      t.timestamps
    end

    add_index :search_analytics, :search_term
    add_index :search_analytics, :search_count
  end
end
