TazkasPollster::Application.routes.draw do
  resources :polls, :only => [:index, :new, :create, :destroy]
  resources :questions
  resources :choices

  # old edit poll
  # edit_poll GET    /polls/:id/edit(.:format) polls#edit

  get     'polls/edit/:edit_key(.:format)'            =>  'polls#edit',                           :as => :poll_edit
  get     'polls/:share_key'                          =>  "polls#show",                           :as => :poll_share
  put     'polls/update/:edit_key(.:format)'          =>  "polls#update",                         :as => :poll_update
  post    'polls/responses/:share_key(.:format)'      =>  'polls#responses',                      :as => :get_responses
  get     'polls/responses/view/:edit_key(.:format)'  =>  'polls#show_responses',                 :as => :view_responses
  get     'peanut/choices/manage/:edit_key/:question_id(.:format)' => 'questions#manage_choices', :as => :manage_choices

  root to: 'polls#index'
  # add a route to go to the edit page of the poll using the edit_key






  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
