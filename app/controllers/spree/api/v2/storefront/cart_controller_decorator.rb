module Spree::Api::V2::Storefront::CartControllerDecorator
    def apply_donation
        spree_authorize! :update, spree_current_order, order_token

        ActiveRecord::Base.transaction do
            spree_current_order.update!(donation: true, updated_at: Time.now)
            ::Spree::PromotionHandler::Cart.new(spree_current_order).activate
            spree_current_order.update_with_updater!
        end

        render_serialized_payload { serialized_current_order }
    end

    def remove_donation
        spree_authorize! :update, spree_current_order, order_token

        ActiveRecord::Base.transaction do
            spree_current_order.update!(donation: false, updated_at: Time.now)
            ::Spree::PromotionHandler::Cart.new(spree_current_order).activate
            spree_current_order.update_with_updater!
        end

        render_serialized_payload { serialized_current_order }
    end
end

::Spree::Api::V2::Storefront::CartController.prepend(Spree::Api::V2::Storefront::CartControllerDecorator)