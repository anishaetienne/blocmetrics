class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.references :app, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :apps
  end
end
