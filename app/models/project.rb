class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :resource
  
  def self.find_all_for_current_user(current_user)
    @resource = Resource.find_by_firstname(current_user)
    find_all_by_owner(@resource.id)
  end
  
  def self.current_project
    find_by_id(session[:project_id])
  end
  
  def self.title(project_id)
    find_by_id(project_id).title
  end
end
