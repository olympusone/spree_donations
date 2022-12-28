module Spree::V2::Storefront::StoreSerializerDecorator
  def self.prepended(base)
      base.attribute :accept_donations do |store|
        store.preferred_accept_donations
      end

      base.attribute :donation_front_text do |store|
        store.preferred_donation_front_text
      end
  end
end

::Spree::V2::Storefront::StoreSerializer.prepend(Spree::V2::Storefront::StoreSerializerDecorator)