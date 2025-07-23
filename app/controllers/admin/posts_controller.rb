module Admin
  class PostsController < ApplicationController
    before_action :require_authentication, :require_admin

    def new
      @post = Post.new
    end

    def create
      if @post = Post.create(post_params)
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
      params.expect(post: [:title, :body, :banner_image])
    end
  end
end