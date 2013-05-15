Spree::Order.class_eval do
  attr_accessible :subscription_id

  belongs_to :subscription, :class_name => "Spree::Subscription"

  state_machine :initial => :cart do
    after_transition :to => :complete, :do => :activate_subscriptions!
  end

  def activate_subscriptions!
    line_items.each do |line_item|
      line_item.subscription.activate if line_item.subscription
    end
  end

end
