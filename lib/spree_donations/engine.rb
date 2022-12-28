module SpreeDonations
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_donations'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    config.after_initialize do
      Spree::PermittedAttributes.store_attributes.push :preferred_accept_donations, :preferred_donation_front_text
      Spree::PermittedAttributes.checkout_attributes << :donation

      config.spree.promotions.rules << Spree::Promotion::Rules::Donation
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
