class CreateFavRelationships < ActiveRecord::Migration
  def change
    create_table :fav_relationships do |t|
      t.references :user, index: true
      t.references :fav_tweet, index: true

      t.timestamps null: false
      t.index [:user_id, :fav_tweet_id], unique: true
    end
  end
end
