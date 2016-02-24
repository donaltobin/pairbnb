class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id, null:false
      t.string :title, null:false
      t.text :description, null:false
      t.string :street_address, null:false
      t.string :city, null:false
      t.string :country, null:false
      t.string :property_type, null:false
      t.integer :number_of_guests, null:false
      t.integer :number_of_bedrooms, null:false
      t.integer :number_of_beds, null:false

      t.timestamps null: false
    end
  end
end
