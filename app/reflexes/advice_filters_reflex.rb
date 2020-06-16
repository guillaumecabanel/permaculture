# frozen_string_literal: true

class AdviceFiltersReflex < ApplicationReflex
  def filter_garden_category
    params[:garden_category] = element.value
  end
end
