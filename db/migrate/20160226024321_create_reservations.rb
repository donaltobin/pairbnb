class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :check_in
      t.string :check_out
      t.integer :guests
      t.integer :user_id
      t.integer :listing_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
