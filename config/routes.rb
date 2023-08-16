Rails.application.routes.draw do
  resources :restaurants do
    collection do
      get :top # get '/restaurants/top'
    end
  end
end
