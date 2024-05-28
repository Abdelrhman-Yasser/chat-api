Rails.application.routes.draw do

  get 'applications/:token', to: 'applications#show'

  resources :applications, only: [:index, :create] do 
    resources :chats, only: [:show]
  end

  get 'applications/:token/chats/', to: 'chats#index'
  post 'applications/:token/chats/', to: 'chats#create'

  resources :chats, only: [] do
    resources :messages, only: [:index, :create] do
      collection do
        get 'search'
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
