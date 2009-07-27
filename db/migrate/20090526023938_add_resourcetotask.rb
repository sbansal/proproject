class AddResourcetotask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :resource, :string
  end

  def self.down
    remove_column :tasks, :resource
  end
end
