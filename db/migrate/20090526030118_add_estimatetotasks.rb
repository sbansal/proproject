class AddEstimatetotasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :estimate, :string
  end

  def self.down
    remove_column :tasks, :estimate
  end
end
