class Post < ApplicationRecord
  # Post: title(required & unique), body
has_many :comments, dependent: :destroy
belongs_to :user
belongs_to :category
has_many :favourites, dependent: :destroy
has_many :favouriters, through: :favourites, source: :user
has_many :taggings, dependent: :destroy
has_many :tags, through: :taggings
validates :title, presence: true, uniqueness: true



def user_full_name
  if user
    user.full_name
  else
    'Anonamous'
  end
end

def favor_for(user)
  favourites.find_by(user: user)
end

end
