class RemoveContentFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :summaty, :text

    remove_column :posts, :body, :text
  end
end
