class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @list.bookmarks.build # reviasr esta línea
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list), notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  private

  def list_params
    # params.require(:list).permit(:name, :image_url)
    params.require(:list).permit(:name, :image_url, bookmarks_attributes: [:id, :movie_id, :comment, :_destroy])
  end
end
