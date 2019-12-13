class Feed::HomeController < FeedController
  before_action :set_user

  def index
    @user.build_user_profile if @user.user_profile.blank?      
    @posts = Post.all.order(created_at: :desc)
  end

  def new   
    @post = Post.new
  end

  def create

    @post = Post.new post_params.merge(user: @user)

      if @post.save
        redirect_to feed_home_index_path
      end
    end

  private
  def post_params
    params.require(:post).permit(:post, :user,)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end 
