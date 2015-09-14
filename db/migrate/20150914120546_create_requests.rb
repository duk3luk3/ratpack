class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :cmdr_name
      t.string :platform
      t.integer :system_id
      t.boolean :oxygen_timer

      t.timestamps null: false
    end
  end
end
