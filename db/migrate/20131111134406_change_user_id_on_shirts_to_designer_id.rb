class ChangeUserIdOnShirtsToDesignerId < ActiveRecord::Migration
  def change
    rename_column :shirts, :user_id, :designer_id
  end
end
