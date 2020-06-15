class AdvicesController < ApplicationController
  def index
    @advices = Advice.all.limit(100)
  end
end
