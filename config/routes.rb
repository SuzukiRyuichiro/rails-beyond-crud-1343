Rails.application.routes.draw do
  resources :restaurants do
    # collection do
    #   get :top # get '/restaurants/top'
    # end

    # member do
    #   get :chef # get '/restaurants/43/chef'
    # end

    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy, :edit, :update]
end
