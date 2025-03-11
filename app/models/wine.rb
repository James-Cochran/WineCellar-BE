class Wine < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :wine_type, presence: true
  validates :rating, presence: true
  
end
