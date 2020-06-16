require 'csv'

ACTIONS = [
  { pattern: "Semez",      title: "seed" },
  { pattern: "Plantez",    title: "plant" },
  { pattern: "Secouez", title: "maintenance" },
  { pattern: "secouez", title: "maintenance" },
  { pattern: "Taillez",    title: "trim" },
  { pattern: "Arrosez",    title: "watering" },
  { pattern: "Récoltez",   title: "harvest" },
  { pattern: "compost",    title: "compost" },
]

MAINTENANCE = %w(
  Binez
  Buttez
  Broyez
  Couvrez
  Coupez
  Débuttez
  Désherber
  désherber
  Installez
  Nettoyez
  Paillez
  Protéger
  Protéger
  Protégez
  Travaillez
  Secouez
  secouez
  Posez
  Stratifiez
  Éliminez
  Supprimez
  supprimez
  Griffez
  Triez
)

def set_garden_category(text)
  case text.strip
  when 'Au potager'           then 'vegetable_garden'
  when 'Au verger'            then 'orchard'
  when 'Au jardin d’ornement' then 'ornamental_garden'
  end
end

def action_for(content)
  ACTIONS.each do |action|
    if content.match(/#{action[:pattern]}/)
       return action[:title]
    end
  end

  MAINTENANCE.each do |action|
    if content.match(/#{action}/)
       return 'maintenance'
    end
  end

  return 'other'
end

print 'Deleting data...'
Advice.destroy_all
puts 'OK'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
file_path = File.join(Rails.root, 'db', 'csv', 'enriched_advices.csv')

puts 'Importing advices from CSV'

CSV.foreach(file_path, csv_options) do |row|
  advice = Advice.create!(
    from_date:       DateTime.parse(row['from_date']),
    to_date:         DateTime.parse(row['to_date']).end_of_day,
    content:         row['content'],
    garden_category: set_garden_category(row['garden_category']),
  )

  advice.action = action_for(advice.content)
  advice.save

  print '.'
end

puts "\nOK"
