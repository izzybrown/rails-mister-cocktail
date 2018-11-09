class CocktailsController < ApplicationController


  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    # @ingredients = Dose.where([:cocktail_id == :id])
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @cocktail.save && @dose.save
      redirect_to cocktails_path
    else
      render :new
    end

  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def dose_params
    params[:cocktail].require(:dose).permit(:description, :ingredient_id)
  end
end
