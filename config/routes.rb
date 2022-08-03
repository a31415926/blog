Rails.application.routes.draw do
  get '/articles', to: 'post#index'
  post '/articles', to: 'post#new'
  put '/articles/:id', to: 'post#update'
  get '/articles/:id', to: 'post#show'
  delete '/articles/:id', to: 'post#destroy'
end
