class User < ApplicationRecord
  has_many :wines, dependent: :destroy

  validates :username, presence: true
end
