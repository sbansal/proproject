class AddAttributesToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :firstname, :string
    add_column :resources, :lastname, :string
    add_column :resources, :email, :string
  end

  def self.down
    remove_column :resources, :email
    remove_column :resources, :lastname
    remove_column :resources, :firstname
  end
end
