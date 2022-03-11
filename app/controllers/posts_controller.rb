class PostsController < ApplicationController
  def create
  end

  def new
  end

  def edit
  end

  def show
    @post = Post.find_by(id: params[:id])
    @post ||= "It seems that post of ID=#{params[:id]} does not exist."
  end

  def index
    @posts = Post.all
    @var1 = "My test variable that will be passed to the index view."
  end

  def update
  end

  def destroy
  end
end
