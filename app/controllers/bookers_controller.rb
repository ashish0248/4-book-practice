class BookersController < ApplicationController
  def index
  	@bookers = Booker.all
  	@booker = Booker.new
  end

  def top
  end

  def show
  	@booker = Booker.find(params[:id])
  end

  def edit
  	@booker = Booker.find(params[:id])
  end
  def update
  	booker = Booker.find(params[:id])
  	booker.update(booker_params)
  	flash[:success] = "Book was successfully updated."
  	redirect_to booker_path(booker.id)
  end

  def create
  	@booker = Booker.new(booker_params)
    @bookers = Booker.all
    if @booker.save
      flash[:success] = "Book was successfully created."
      redirect_to booker_path(@booker.id)
    else
      render 'index'

    end

  end

  def destroy
  	booker = Booker.find(params[:id])
  	booker.destroy
  	flash[:success] = "Book was successfully destroyed."
  	redirect_to bookers_path
  end

  private
  def booker_params
  	params.require(:booker).permit(:title, :body)
  end
end
