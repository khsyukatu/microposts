class FavRelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :fav_tweet, :class_name => "Micropost", :foreign_key => "fav_tweet_id"
end
