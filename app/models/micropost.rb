class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :retweets, :class_name => "Micropost", :foreign_key => "retweet_from_id"
  belongs_to :retweet_from, class_name: "Micropost"
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }, if: "retweet_from_id.nil?"
  
  mount_uploader :image, ImageUploader

end
