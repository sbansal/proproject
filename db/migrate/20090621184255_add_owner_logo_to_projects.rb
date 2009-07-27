class AddOwnerLogoToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :logo_image_url, :string
    add_column :projects, :owner, :string
  end

  def self.down
    remove_column :projects, :owner
    remove_column :projects, :logo_image_url
  end
end
