class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :task_number
      t.string :title
      t.text :description
      t.string :status
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
