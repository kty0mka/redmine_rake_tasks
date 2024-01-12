class RakeTasksController < ApplicationController
  # include Redmine::I18n
    before_action :require_admin
  
    # accept_api_auth :execute_task
    # before_action :require_permission
  
    def execute
      # task = params[:task]
      task_name = params[:task].to_s.strip
      allowed_tasks = ["my_safe_task1", "my_safe_task2"] # Define allowed tasks  

      if allowed_tasks.include?(task_name)
        output = `RAILS_ENV=#{Rails.env} bundle exec rake #{task_name}`
        render json: { status: 'success', output: output }
      else
        render json: { status: 'error', message: 'Task not allowed or not found' }, status: :forbidden
      end
  
    end
  
    private
  
    def require_admin
      render_403 unless User.current.admin?
    end

    # def execute_task
    #   require File.expand_path('../../../../config/environment', __dir__)
    #   task_name = params[:task_name]
  
    #   # Execute the Rake task only if the user is an admin
    #   result = `bundle exec rake #{task_name} RAILS_ENV=#{Rails.env} 2>&1`
    #   render json: { result: result }
    # end
  
    # private
  
    # def require_permission
    #   # Only admin users are allowed to execute rake tasks
    #   unless User.current&.admin?
    #     render json: { error: 'Not allowed to execute this task' }, status: :forbidden
    #   end
    # end

end