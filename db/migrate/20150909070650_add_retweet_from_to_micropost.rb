class AddRetweetFromToMicropost < ActiveRecord::Migration
  def change
    add_reference :microposts, :retweet_from, index: true
  end
end
