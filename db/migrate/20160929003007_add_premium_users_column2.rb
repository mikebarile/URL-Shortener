class AddPremiumUsersColumn2 < ActiveRecord::Migration
  def change
    remove_column :users, :premium?
    add_column :users, :premium, :boolean
  end
end
