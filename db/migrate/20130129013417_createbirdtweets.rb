class Createbirdtweets < ActiveRecord::Migration
  def up
  	create_table :bird_tweets do |t|
  		t.string :content
  		t.integer :user_id

  		t.timestamps
  	end
  end

  def down
  end
end
