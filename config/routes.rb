Rails.application.routes.draw do
  get '/characters' => 'games#index'
  get '/characters/new' => 'games#new'
  get '/characters/:id' => 'games#show'
  get '/characters/:id/edit'=> 'games#edit'
  patch '/characters/:id'=> 'games#update'
  post '/characters' => 'games#create'
  delete '/characters/:id' => 'games#destroy'
end
