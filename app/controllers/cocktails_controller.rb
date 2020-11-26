class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all

    @markers = @cocktails.geocoded.map do |cocktail|
      {
        lat: cocktail.latitude,
        lng: cocktail.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { cocktail: cocktail }),
        image_url: helpers.asset_url('default.jpg')
      }
    end
  end

  def show
    @dose = Dose.new
  end

  def new
  	@cocktail = Cocktail.new
  end

  def create
  	@cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render 'new'
    end  
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :address, :photo)
  end

end
