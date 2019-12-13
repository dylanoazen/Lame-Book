class Feed::PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def like
    post = Post.find(params[:post_id]) 
    like_count = post.like_count
    like = current_user.like.find_by(post_id: post.id)

    if like.blank?
      new_like = Like.new(post_id: post.id, user_id: current_user.id)
      post.update(like_count: like_count += 1)
      new_like.save
    else
      Like.destroy(like.id)
      post.update(like_count: like_count -= 1)
    end
    redirect_to feed_home_index_path
  end



  private
  def post_params
    params.require(:post).permit(:post, :user, :like)
  end
end