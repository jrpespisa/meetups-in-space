class AddIndexToMeetupsName < ActiveRecord::Migration
  def up
    change_column :meetups, :name, :string, index: true
  end

  def down
    change_column :meetups, :name, :string
  end
end
