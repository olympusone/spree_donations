module Spree::V2::Storefront::CartSerializerDecorator
    def self.prepended(base)
        base.attribute :donation
    end
end
  
::Spree::V2::Storefront::CartSerializer.prepend(Spree::V2::Storefront::CartSerializerDecorator)