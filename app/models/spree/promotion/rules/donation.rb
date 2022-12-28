module Spree
    class Promotion
        module Rules
            class Donation < Spree::PromotionRule
                def applicable?(promotable)
                    promotable.is_a?(Spree::Order)
                end

                def eligible?(order, options = {})
                    order.donation?
                end
            end
        end
    end
end
  