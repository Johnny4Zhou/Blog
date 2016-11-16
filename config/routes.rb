Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/about' => 'home#about'
  get '/reset' => 'home#reset', as: :reset_home
  get '/confirm' =>'home#confirm', as: :confirm_home
  get '/change' =>'home#change', as: :change_home

resources :users, only: [:create, :new, :edit, :update, :show]

resources :sessions, only: [:create, :new] do
  delete :destroy, on: :collection
end

resources :tags, only: [:show]
  # get  '/posts/new' => 'posts#new', as: :new_post
  # post '/posts' =>'posts#create', as: :posts
  # get '/posts/:id' => 'posts#show', as: :post
  # get  '/posts' =>'posts#index'
  # get '/posts/:id/edit' => 'posts#edit', as: :edit_post
  # patch '/posts/:id'   => 'posts#update'
  # delete '/posts/:id'  => 'posts#destroy'
  resources :posts, shallow: true do
  get :search, on: :collection
  get :flat, on: :member
  post :approve
  resources :comments, only: [:create, :destroy]
  resources :favourites, only: [:create, :destroy]
  end


end
