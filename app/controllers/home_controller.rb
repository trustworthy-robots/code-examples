class HomeController < ApplicationController
  def index
    @last_post = Post.published.last
  end
end
