class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  private
  def bookmark_params
    params.require(:bookmarks).permit(:movie_id)
  end
end
