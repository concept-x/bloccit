class AddTopicToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :topic_id, :integer
    # #you should always index your foreign key columns
    add_index :posts, :topic_id
  end
end
