class AddSignInFailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sign_in_fails, :integer
  end
end
