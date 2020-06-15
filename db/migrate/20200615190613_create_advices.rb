class CreateAdvices < ActiveRecord::Migration[6.0]
  def change
    create_table :advices do |t|
      t.text :content
      t.string :garden_category
      t.datetime :from_date
      t.datetime :to_date
      t.string :action, default: 'other'

      t.timestamps
    end
  end
end
