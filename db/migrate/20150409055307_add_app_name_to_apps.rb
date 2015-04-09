class AddAppNameToApps < ActiveRecord::Migration
  def change
    add_column :apps, :app_name, :string
  end
end
