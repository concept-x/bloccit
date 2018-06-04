class PostsController < ApplicationController
  def index
#returns a collection of Post objects
    @posts = Post.all

# assignment 17: mark every 5th post SPAM
  #  @posts.each_with_index do |post, index|
  #    if index % 5 == 0
  #      post.title = "SPAM"
  #    end
  # end
  end

  def show
    #necessary
  end

  def new
    @post = Post.new
  end

  def edit
  end
end
