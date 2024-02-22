class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

end
