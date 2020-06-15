class AdviceComponent < ViewComponent::Base
  ACTION_ICONS = {
    seed:        'seed',
    plant:       'tree-planting',
    maintenance: 'gloves',
    watering:    'irrigation',
    compost:     'compost',
    harvest:     'scythe',
    trim:        'shears',
    other:       'cabbage'
  }

  def initialize(advice:)
    @advice = advice
  end

  def action_icon
    image_tag "action-icons/#{ACTION_ICONS[@advice.action.to_sym]}-48.png"
  end
end
