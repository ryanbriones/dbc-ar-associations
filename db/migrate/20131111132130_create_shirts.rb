class CreateShirts < ActiveRecord::Migration
  def change
    create_table :shirts do |t|
      # t.belongs_to :user
      # t.references :user
      t.integer :user_id
    end
  end
end
