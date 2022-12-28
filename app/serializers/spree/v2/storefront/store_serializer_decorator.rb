module Spree::V2::Storefront::StoreSerializerDecorator
  def self.prepended(base)
      base.attribute :accept_donations do |store|
        store.preferred_accept_donations
      end
  end
end

::Spree::V2::Storefront::StoreSerializer.prepend(Spree::V2::Storefront::StoreSerializerDecorator)