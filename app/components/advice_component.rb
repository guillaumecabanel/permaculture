class AdviceComponent < ViewComponent::Base
  def initialize(advice:)
    @advice = advice
  end
end
