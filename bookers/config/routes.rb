Rails.application.routes.draw do
  get '/' => 'homes#top'
  
  get 'books' => 'books#index'
  get 'books' => 'books#new'
  get 'books/:id' => 'books#show', as:'book'
  post 'books/:id' => 'books#create'
  get 'books/:id/edit' => 'books#edit', as:'edit_book'
  patch 'books/:id' => 'books#update', as:'update_book'
  delete 'books/:id' => 'books#destroy', as:'destroy_book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
