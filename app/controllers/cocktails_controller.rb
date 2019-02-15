class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
     @cocktail = Cocktail.find(params[:id])
     @doses = Dose.where(cocktail_id:  @cocktail.id)
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(coacktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def coacktail_params
    params.require(:cocktail).permit(:name)
  end
end
