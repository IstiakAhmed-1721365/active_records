class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :like_count
      t.integer :user_id

      t.timestamps
    end
  end
end
