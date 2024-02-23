class ListsController < ApplicationController

  before_action :set_list, only: [ :show ]

  def home
    index_lists()
  end

  def index
    # redirect_to root_path
    # index_lists()
  end

  def show; end

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

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :id)
  end

  def index_lists
    @lists = List.all
  end

end
