class Api::PostsController < ApplicationController
  before_action :set_posts, only: [:show, :update,:destroy]
  respond_to :json

  def index
    @posts = Post.all
    render json: @posts, status: 200
  end

  def create
    @post = Post.new(post_params)  
    if @post.save
      render json: @post, status: 201
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @post, status: 200
  end

  def update
    if @post.update(post_params)
      render json: @post, status: 200
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: @post, status: 204
  end

  #######
  private
  #######

  def set_posts
    @post = Post.find_by_post_path(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end