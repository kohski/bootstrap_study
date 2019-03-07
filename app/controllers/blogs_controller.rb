class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params.require(:blog).permit(:title, :content))
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end 

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path,notice: 'deleted!'
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(params.require(:blog).permit(:title,:content))
    redirect_to blogs_path,notice: 'edited'
  end

end
