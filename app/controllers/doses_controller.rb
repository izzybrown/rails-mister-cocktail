class DosesController < ApplicationController


  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  def destroy
    dose = find_dose
    dose.destroy
    redirect_to doses_path
  end

  private


  def doses_params
    params.require(:dose).permit(:description)
  end
end
