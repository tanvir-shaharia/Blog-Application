module Admin
  class PostsController < ApplicationController
    before_action :require_authentication, :require_admin
    before_action :set_post, only: [:edit, :update, :destroy]

    def new
      @post = Post.new
    end

    def edit
    end

    def update
      if @post.update(post_params)
        redirect_to @post, notice: "Post Update Success"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @post.destroy!
      redirect_to root_path, notice: "Post was Successfully Deleted"
    end

    def create
      if (@post = Post.create(post_params))
        redirect_to @post, notice: "Post create Success"
      else
        render new
      end
    end

    private

    def require_admin
      unless Current.session.user.admin?
        redirect_to root_path, alert: "You are not Authorized for view this page"
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :banner_image)
    end

    def set_post
      @post = Post.friendly.find(params[:id])
    end
  end
end