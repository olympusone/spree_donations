class StoreSerializer < Spree::V2::Storefront::StoreSerializer
  attribute :accept_donations do |store|
    store.preferred_accept_donations
  end
end