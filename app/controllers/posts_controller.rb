class PostsController < ApplicationController
  def index
#returns a collection of Post objects
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
