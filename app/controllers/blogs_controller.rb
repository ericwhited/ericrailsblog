class BlogsController < ApplicationController

    before_action :authenticate_user!
    
    def index
        @user = current_user.email
        @blogs = Blog.all
        @users = User.all
    end

    def new
        @blog = Blog.new 
    end

    def create
        @blog = Blog.new(blog_params)
        @blog.user_id = current_user.id
        if @blog.save
            redirect_to '/'
        else
            render '/blogs/new'
        end
    end

    def show
        @blog = Blog.find(params[:id])
    end

    private 

    def blog_params
        params.require(:blog).permit(:title, :body, :user_id)
    end

end
