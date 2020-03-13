Rails.application.routes.draw do
    root to: 'rasks#index'
    resources :rasks
end
