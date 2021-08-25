Rails.application.routes.draw do
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "welcome/index"  
  post "addresses/load_address_data"
  post "addresses/cep_api"

  namespace :api, :defaults => {:format => :json} do
  	namespace 'v1' do
  		get "cep_api/json/:cep", to: "cep_api#json"
      post "cep_api/via_post", to: "cep_api#via_post"
  	end
  end
  root to: "addresses#index"  
end
