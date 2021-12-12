Rails.application.routes.draw do
  namespace :api do
    post '/login', to: '/api/user#login'
  end
end
