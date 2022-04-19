Rails.application.routes.draw do
  # [debug]ルートパス追記
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
end
