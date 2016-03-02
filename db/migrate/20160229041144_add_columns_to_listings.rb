class AddColumnsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :price, :integer, null: false
    add_column :listings, :start, :date, null: false
    add_column :listings, :end, :date, null: false
  end
end
