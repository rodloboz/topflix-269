Rails.application.routes.draw do
  root to: 'pages#home'

  resource :search, only: :show
end
