class Api::PostsController < ApplicationController
  before_action :set_posts, only: [:update]
  respond_to :json

  def search
    if params[:search].present?
      @post = Post.where("title like :search OR body like :search OR post_path like :search", search: "%#{params[:search]}%")
    else
      @post = Post.all  
    end
    render json: @post, status: 200
  end

  def index
    @posts = Post.all
    render json: @posts, status: 200
  end

  def create
    @post = Post.new(post_params)  
    if @post.save
      render json: @post, status: 201
    else
      render json: {errors: @post.errors}, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find_by_post_path(params[:id])
    render json: @post, status: 200
  end

  def update
    if @post.update(post_params)
      render json: @post, status: 200
    else
      render json: {errors: @post.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: @post, status: 204
  end

  #######
  private
  #######

  def set_posts
    @post = Post.find_by_post_path(params[:post][:post_path])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end