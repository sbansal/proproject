class AddTimelinetotask < ActiveRecord::Migration
  def self.up
     add_column :tasks, :startdate, :date
     add_column :tasks, :enddate, :date
  end

  def self.down
    drop_column :tasks, :startdate
    drop_column :tasks, :enddate    
  end
end
