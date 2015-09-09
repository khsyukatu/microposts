class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  has_many :retweet_relationships, class_name: "Retweet",
                                  foreign_key: "retweet_post_id",
                                  dependent: :destroy
  has_many :retweet_users, through: :retweet_relationships, source: :retweet_user
end
