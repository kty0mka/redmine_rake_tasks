Redmine::Plugin.register :redmine_rake_tasks do
    name 'Rake Task API'
    author 'ArKa'
    description 'A Redmine plugin to initiate Rake tasks via API.'
    version '0.1.0'
    url 'https://kalaydov.com'
    author_url 'dev@kalaydov.com'
  
    permission :rake_tasks, { :rake_tasks => [:execute] }, :public => true
    menu :admin_menu, :rake_tasks, { :controller => 'rake_tasks', :action => 'index' }, :caption => 'Rake Tasks'  
    # menu :admin_menu, :rake_task_api, { controller: 'rake_task_api', action: 'execute_task' }, caption: 'Rake Task API'
end