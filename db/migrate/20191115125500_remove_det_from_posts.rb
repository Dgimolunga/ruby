class RemoveDetFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :summary, :text

    remove_column :posts, :body, :text
  end
end
