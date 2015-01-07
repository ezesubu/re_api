class AddDeviseFieldsToUsuarios < ActiveRecord::Migration
  def change  	
    add_column :usuarios, :encrypted_password, :string
  end

  def up
    change_column(:password, :created_at, :datetime, :null => true)
    change_column(:password, :updated_at, :datetime, :null => true)
  end

  def down
    change_column(:password, :created_at, :datetime, :null => false)
    change_column(:password, :updated_at, :datetime, :null => false)
  end
end
