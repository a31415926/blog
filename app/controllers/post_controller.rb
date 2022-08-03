class PostController < ApplicationController
  include ErrorSerializer

  skip_before_action :verify_authenticity_token
  before_action :set_post , only: [:show, :update, :destroy]
  before_action :post_params, only: [:new, :update]

  def index
    @post = Post.all
    render json: @post, status: :ok
  end

  def new
    @post = Post.new @post_params
    if @post.save
      render json: @post, status: :created
    else
      render_error(@post.errors)
    end 
  end

  def show
    render json: @post, status: :ok
  end

  def update
    if @post.update @post_params
      render json: @post
    else 
      render_error(@post.errors)
    end
  end

  def destroy
    if @post.destroy
      render json: {}, status: :no_content
    else
      render_error(@post.errors)
    end
  end 

  private

  def render_error(errors)
    render json: ErrorSerializer.serialize(errors), status: :bad_request
  end

  def post_params
    if params[:post].empty?
      render json: {error: 'Empty fields'}, status: :bad_request
    else
      @post_params = params.require(:post).permit(:title, :body)
    end
  end 

  def set_post
    @post = Post.find_by(id: params[:id])
    render json: {error: 'post not found'}, status: :not_found unless @post
  end
end