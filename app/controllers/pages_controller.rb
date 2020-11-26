class PagesController < ApplicationController
  def home
    @cocktails = Cocktail.all
    @markers = @markers.to_json
  end
end