class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @current_user = current_user
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.commentsCounter = 0
    @post.likesCounter = 0
    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_url(current_user.id)
    else
      flash.now[:error] = @post.errors.full_messages.to_sentence
      render :new, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
