class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  def new
    @title = "Add a movie to #{@list.name}"
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:comment, :movie_id))
    @bookmark.list = @list
    @bookmark.save ? (redirect_to @list) : (render list_path(@list))
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end
end
