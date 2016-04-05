class Link < ActiveRecord::Base
  before_validation :add_http_if_not_present

  validates :user, :title, presence: true
  validates :url, :format => { with: /\Ahttp(|s):\/\// }

  def add_http_if_not_present
    unless self.url =~ /\Ahttp(|s):\/\//
      self.url = "http://" + url
    end
  end

  belongs_to :user
  has_many :votes
  has_many :comments
end
