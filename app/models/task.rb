class Task < ActiveRecord::Base
  acts_as_list
  
  belongs_to :project
  
  def self.late_tasks
    find(:all, :conditions => 'enddate <= now()' )
  end
  
  def self.due_this_week
    find(:all, :conditions => ["enddate <= ? and completed_at is NULL",7.days.to_i.from_now])
  end
  
  def self.complete
    find(:all, :conditions => ['completed_at <= ?', 7.days.to_i.from_now])
  end
  
  def self.todo_for_current_user(id)
    find(:all, :conditions => ["resource = ? and completed_at is NULL",id])
  end
end
