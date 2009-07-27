class TasksController < ApplicationController
  layout 'projects'
  
  before_filter :require_user, :current_project

  def index
    session[:current_page] = nil
    session[:current_page] = "plan"
    if session[:project_id]
      @tasks = Project.find(session[:project_id]).tasks
    else 
      session[:project_id] = @current_project.id
      @tasks = @current_project.tasks
    end
    @tasks = @tasks.sort_by{|i| i[:position]}
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  def edit
    @task = Task.find(params[:id])
  end
  

  def create
    @task = Task.new(params[:task])
    debugger
    @task.project_id = session[:project_id]
    respond_to do |format|
      if @task.save
        flash[:notice] = 'Task was successfully created.'
        format.html { redirect_to(@task) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        flash[:notice] = 'Task was successfully updated.'
        format.html { redirect_to(@task) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end
  
  def edit_task
    @task = Task.find(params[:id]) 
    render :update do |page|
      page.insert_html :top, "task_#{@task.id}", :partial => 'edittask', :object => @task
      # page.visual_effect :opacity, 'field', {:from => 1.0, :to => 0.5, :duration => 0.5}
      #       page << "$('submit').disabled = 'true'"
      
    end
  end
  
  def update_task
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      render :update do |page|
        page.replace "task_#{@task.id}", :partial => "task", :object => @task
        page.visual_effect :highlight, "task_#{@task.id}"
        # page.visual_effect :opacity, 'field', {:from => 0.5, :to => 1.0, :duration => 0.2}
      end
    end
  end
  
  def edit_dashboard_task
    @task = Task.find(params[:id]) 
    render :update do |page|
      page.insert_html :top, "task_#{@task.id}", :partial => 'updatetask', :object => @task
      # page.visual_effect :opacity, 'field', {:from => 1.0, :to => 0.5, :duration => 0.5}
      #       page << "$('submit').disabled = 'true'"
      
    end
  end
  
  def update_dashboard_task
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      render :update do |page|
        page.replace "task_#{@task.id}", :partial => "dashboard_task", :object => @task
        page.visual_effect :highlight, "task_#{@task.id}"
        # page.visual_effect :opacity, 'field', {:from => 0.5, :to => 1.0, :duration => 0.2}
      end
    end
  end

  def complete
    
    @task = Task.find(params[:id])
    debugger
    #     @task.completed_at = Time.now
    @task.update_attribute(:completed_at,Time.now)
    respond_to do |format|
      format.html { redirect_to(dashboard_path) }
      format.xml  { head :ok }
    end
  end
  
  
  def sort
    params[:taskslist].each_with_index do |id, index|
      Task.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  def set_project
    session[:project_id] = params[:id]
    redirect_to project_plan_path(session[:project_id])
  end
  
  def dashboard
    @due_tasks = Task.due_this_week.group_by { |t| t.project_id} 
    @completed_tasks = Task.complete.group_by { |t| t.project_id}
    session[:current_page] = nil
    session[:current_page] = "dashboard"
  end
  
  def todo
    session[:current_page] = nil
    session[:current_page] = "todo"
    @todo_tasks = Task.todo_for_current_user(current_user.id)
  end
  
  def task_complete
    #TODO....
  end
end
