class AddUniqueTrueToUsersEmail < ActiveRecord::Migration
  def up
    change_column :users, :email, :string, unique: true
  end

  def down
    change_column :users, :email, :string
  end
end
