Rails.application.routes.draw do
  get 'user/confirmation'
  post 'user/confirmation'
  get '/user' => 'user#index'
  get 'user/new'
  post 'user' => 'user#create'
  post 'user/check' => 'user#check'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
