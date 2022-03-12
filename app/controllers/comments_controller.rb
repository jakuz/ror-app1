class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment has been added.'
      redirect_to comments_path
    else
      flash[:alert] = 'Something went wrong while creating comment.'
      render :new
    end
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment ##{@comment.id} has been updated."
      redirect_to comments_path
    else
      flash[:alert] = 'Something went wrong while updating comment.'
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment ##{@comment.id} has been deleted."
      redirect_to comments_path
    else
      flash[:alert] = "Something went wrong while deleting comment."
      redirect_to comments_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
