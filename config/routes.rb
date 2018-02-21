Rails.application.routes.draw do
  devise_for :users
  resources :clients
  resources :invoices
  resources :invoicedetails
  resources :inventories
  resources :products
  resources :homepages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#CMERCADO

root "homepages#index"

end
