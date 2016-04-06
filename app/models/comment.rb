class Comment < ActiveRecord::Base
  validates :body, :user, presence: true

  belongs_to :link
  belongs_to :user
end
