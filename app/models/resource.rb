class Resource < ActiveRecord::Base
  has_many :projects
  
  def self.resource(resource_id)
    find_by_id(resource_id).firstname.capitalize
  end
end
