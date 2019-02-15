class DosesController < ApplicationController
  def create
    @dose = Dose.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

private

  def review_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
