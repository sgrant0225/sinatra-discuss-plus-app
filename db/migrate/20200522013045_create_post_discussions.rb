class CreatePostDiscussions < ActiveRecord::Migration
  def change 
    create_table :post_discussions do |t|
      t.string :topic
      t.string :content
      t.string :date
      t.integer :user_id
      
      t.timestamps null: false 
    end
  end
end
