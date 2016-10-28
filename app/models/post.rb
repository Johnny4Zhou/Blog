class Post < ApplicationRecord
  # Post: title(required & unique), body
has_many :comments, dependent: :destroy
belongs_to :user
belongs_to :category
validates :title, presence: true, uniqueness: true



def user_full_name
    if user
      user.full_name
    else
      'Anonamous'
    end

end
end
