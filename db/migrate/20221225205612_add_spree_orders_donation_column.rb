class AddSpreeOrdersDonationColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :donation, :boolean, default: false
  end
end
