class PostsController < ApplicationController
  def show
    if params[:id].present?
      @post = Post.find(params[:id])
    else
      @post = Post.published.last || Post.new
    end

    @posts_collection = PostsCollection.new(Post.published, @post)
  end

  def index
    last_post = Post.published.last
    if last_post.present?
      redirect_to post_path(last_post)
    else
      redirect_to root_path, flash: { notice: 'Nothing here yet' }
    end
  end
end
