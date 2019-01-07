Rails.application.routes.draw do
  get 'tasks/new'
  get 'sessions/new'
  root 'pages#index'
  # get 'tasks/index2'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destory'

  resources :users, except: [:index]
  patch "/tasks/:id/date_update",to: "tasks#date_update",as: "task_date_update"
  resources :tasks
  # post "tasks/:id/update",to: "tasks#update"
end
