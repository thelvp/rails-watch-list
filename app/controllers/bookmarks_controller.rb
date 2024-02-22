class BookmarksController < ApplicationController

  before_action :set_list, only: [ :new, :create ]

  def new
    @bookmark = Bookmark.new
    # Instantialize list, not creating it
    # @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @list = List.find(params[:list_id])
    # List set above = list of this bookmark
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    # Add movie ID to use it to create Bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
