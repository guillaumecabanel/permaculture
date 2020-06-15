class AdvicesController < ApplicationController
  def index
    @advices = Advice.all.limit(10)
  end
end
