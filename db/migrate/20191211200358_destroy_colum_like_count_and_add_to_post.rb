class DestroyColumLikeCountAndAddToPost < ActiveRecord::Migration[5.2]
  def change

    remove_column :likes, :like_count, :integer
    add_column :posts, :like_count, :integer, default: 0

  end
end
