class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.integer :api_id
      t.string :name
      t.string :x
      t.string :y
      t.string :z
      t.string :faction
      t.string :population
      t.string :government
      t.string :allegiance
      t.string :state
      t.string :security
      t.string :primary_economy
      t.boolean :needs_permit
      t.string :api_updated_at
      t.string :power_control_faction

      t.timestamps null: false
    end
  end
end
