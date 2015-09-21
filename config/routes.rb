Rails.application.routes.draw do
  
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  controller :static_pages do
    get :home
    get :about
    get :contact
  end
  
  post 'static_pages/thank_you'
  post 'payments/create' => 'orders#show'

  get 'landing_page' => 'static_pages#landing_page'
  get 'featured_page' => 'static_pages#featured_page'
  get 'contact' => 'static_pages#contact'
  get 'about' => 'static_pages#about'
  get 'gallery' => 'static_pages#gallery'
  
  #get 'users/index' => 'users#index'
  #get 'users/show' => 'users#show[:id]'
  #get '/products', to: 'products#new' #redirected products url to orders, for fun!
  
  resources :products do 
    resources :comments
  end
  resources :payments, only: [:index, :show, :new, :create]
    # created with scaffolding - shows all default CRUD routes


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  resources :orders, only: [:index, :show, :new, :create]

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     #   end
end
