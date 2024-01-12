RedmineApp::Application.routes.draw do
    post 'rake_tasks/execute', to: 'rake_tasks#execute'
end