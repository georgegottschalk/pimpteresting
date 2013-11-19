class AddUserIdToPimps < ActiveRecord::Migration
  def change
    add_column :pimps, :user_id, :integer
    add_index :pimps, :user_id
  end
end
