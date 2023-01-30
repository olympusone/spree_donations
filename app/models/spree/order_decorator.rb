module Spree::OrderDecorator
    def can_add_coupon?
        super && !donation?
    end
end

::Spree::Order.prepend(Spree::OrderDecorator)