class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    if !(params[:name]).nil?

      @cocktail = Cocktail.where("#{:name} ilike ?", "%#{params[:name]}%").take
      if @cocktail.nil?
       redirect_to root_path, :alert => "doesn't exist"
      else
        redirect_to @cocktail
      end
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    if @cocktail.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
