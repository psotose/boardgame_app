Rails.application.routes.draw do
  resources :boardgames do
    delete 'delete_image/:image_id', on: :member, to: 'boardgames#delete_image', as: 'delete_image'
  end
  root 'boardgames#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
