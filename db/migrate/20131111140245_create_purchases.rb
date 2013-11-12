class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :purchaser_id
      t.integer :shirt_id
    end
  end
end
