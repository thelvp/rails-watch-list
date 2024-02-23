class ListsController < ApplicationController

  before_action :set_list, only: [ :show, :destroy ]

  def home
    index_lists()
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :id, :photo)
  end

  def index_lists
    @lists = List.all
  end

end
