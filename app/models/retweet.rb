class Retweet < ActiveRecord::Base
  belongs_to :retweet_user, class_name: "User"
  belongs_to :retweet_post, class_name: "Micropost"
end
