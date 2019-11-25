Rails.application.routes.draw do
  root 'posts#index'

  resources :comments
  resources :posts
  scope controller: :say, path: :say do
    get :hello
    get :goodbye

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
