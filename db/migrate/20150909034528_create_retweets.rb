class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.references :retweet_user, index: true
      t.references :retweet_post, index: true

      t.timestamps null: false
      t.index [:retweet_user_id, :retweet_post_id], unique: true
    end
  end
end
