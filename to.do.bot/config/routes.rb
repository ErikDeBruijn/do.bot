Rails.application.routes.draw do
  devise_for :users
  resources :todos

  get '/.well-known/ai-plugin', to: 'well_known#ai_plugin', defaults: { format: 'json' }
  get '/openapi', to: 'well_known#openapi', defaults: { format: 'yaml' }

  # root "todos#index"
  get '/welcome', to: 'pages#welcome'
end
