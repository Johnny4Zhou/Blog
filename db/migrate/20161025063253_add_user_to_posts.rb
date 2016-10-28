class AddUserToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_digest, :string
    add_reference :posts, :user, foreign_key: true
  end
end
