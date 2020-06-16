class Advice < ApplicationRecord
  extend Enumerize

  ACTIONS = %w(
    compost
    harvest
    maintenance
    other
    plant
    seed
    trim
    watering
  )

  GARDEN_CATEGORIES = %w(orchard ornamental_garden vegetable_garden)

  enumerize :action,          in: ACTIONS,           scope: :shallow
  enumerize :garden_category, in: GARDEN_CATEGORIES, scope: :shallow
end
