Spree::Core::Engine.add_routes do
  namespace :api, defaults: { format: 'json' } do  
    namespace :v2 do
      namespace :storefront do
        resource :cart, controller: :cart do
          patch  :apply_donation
          patch  :remove_donation
        end
      end
    end
  end
end