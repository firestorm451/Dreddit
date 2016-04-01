class Link < ActiveRecord::Base
  validates :user, presence: true

  belongs_to :user
  has_many :votes
end
