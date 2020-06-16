class AdvicesController < ApplicationController
  def index
    @advices = Advice.where(garden_category: permitted_garden_category(params[:garden_category]))
  end

  private

  def permitted_garden_category(garden_category)
    Advice.garden_category.values.find { |permitted| garden_category == permitted } || 'orchard'
  end
end
