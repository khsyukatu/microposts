class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :retweet_from, class_name: "Micropost"
  has_many :retweets, :class_name => "Micropost", :foreign_key => "retweet_from_id"
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }, if: "retweet_from_id.nil?"
  validates_uniqueness_of :retweet_from_id, :scope => :user_id, unless: "retweet_from_id.nil?"
  
  mount_uploader :image, ImageUploader
  
end
