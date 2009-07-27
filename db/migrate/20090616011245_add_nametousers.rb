class AddNametousers < ActiveRecord::Migration
  def self.up
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string    
  end

  def self.down
    drop_column :users, :firstname
    drop_column :users, :lastname 
  end
end
