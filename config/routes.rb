Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/songs', to: 'songs#index'
  get '/songs/:id', to: 'songs#show'
  get '/artists/', to: 'artists#index'
  get '/artists/:artist_id/songs', to: 'artist_songs#index'
  get '/artists/new', to: 'artists#new'
  get '/artists/:id/edit', to: 'artists#edit'
  post '/artists/', to: 'artists#create'
  patch '/artists/:id', to: 'artists#update'
  delete '/artists/:id', to: 'artists#destroy'
end
