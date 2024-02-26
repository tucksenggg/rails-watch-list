class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.includes(:movie).where(list_id: params[:id])
  end

  def new
    @new_list = List.new
  end

  def create
    @create_list = List.new(list_params)
    @create_list.save
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
