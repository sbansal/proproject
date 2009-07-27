class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.integer :position
      t.string :css_url

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
