Rails.application.routes.draw do
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "welcome/index"  
  post "addresses/load_address_data"

  namespace 'api' do
  	namespace 'v1' do
  		get "cep_api/json/:cep", to: "cep_api#json"
  	end
  end
  root to: "addresses#index"  
end
