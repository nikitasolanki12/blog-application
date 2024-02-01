class BlogsController < ApplicationController

  def index
     # @blogs = current_user.blogs
     @blogs = current_user.admin? ? Blog.all : current_user.blogs.approved
  end

  def show
  end

  def new
   @blog = current_user.blogs.new
  end

  def create
     @blog = current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog), notice: 'Blog created successfully.'
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'Blog updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: 'Blog deleted successfully.'
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :publication_date)
  end
end
