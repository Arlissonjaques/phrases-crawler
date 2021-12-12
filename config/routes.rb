Rails.application.routes.draw do
  namespace :api do
    post '/login', to: '/api/users#login'
  end
end
