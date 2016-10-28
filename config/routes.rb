Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/about' => 'home#about'

resources :users, only: [:create, :new, :edit, :update]

resources :sessions, only: [:create, :new] do
  delete :destroy, on: :collection
end

  # get  '/posts/new' => 'posts#new', as: :new_post
  # post '/posts' =>'posts#create', as: :posts
  # get '/posts/:id' => 'posts#show', as: :post
  # get  '/posts' =>'posts#index'
  # get '/posts/:id/edit' => 'posts#edit', as: :edit_post
  # patch '/posts/:id'   => 'posts#update'
  # delete '/posts/:id'  => 'posts#destroy'
  resources :posts do
  get :search, on: :collection
  get :flat, on: :member
  post :approve
  resources :comments, only: [:create, :destroy]
  # resources :categories, only: [:create]
  end


end
