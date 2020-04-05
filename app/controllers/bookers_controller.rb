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
  end

  def create
  	booker = Booker.new(booker_params)
  	booker.save
  	redirect_to booker_path(booker.id)
  end



  private
  def booker_params
  	params.require(:booker).permit(:title, :body)
  end
end
