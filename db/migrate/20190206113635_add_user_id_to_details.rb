class AddUserIdToDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :details, :user_id, :integer
  end
end
