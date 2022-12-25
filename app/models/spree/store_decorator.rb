module Spree::StoreDecorator
  def self.prepended(base)
    base.preference :accept_donations, :boolean, default: false
  end
end

::Spree::Store.prepend(Spree::StoreDecorator)