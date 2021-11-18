class ListsController < ApplicationController
  def index
    @lists = List.all
    @lists = @lists.select { |list| list.name.downcase.include? params[:search].downcase } if params[:search]
    @title = params[:search] ? "Lists containing '#{params[:search].downcase}'" : 'All list'
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
    @movies = @list.movies.select { |movie| movie.title.downcase.include? params[:search].downcase } if params[:search]
    @title = @list.name.capitalize
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:name))
    @list.save ? (redirect_to list_path(@list)) : (render :new)
  end
end
